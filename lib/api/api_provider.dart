import 'dart:convert';
import 'dart:io';

import 'package:salespoint_flutter/api/config.dart';
import 'package:salespoint_flutter/api/response_wrapper.dart';

import 'package:http/http.dart' as http;
import 'package:salespoint_flutter/utils/logger.dart';

class ApiProvider {
  static const String _baseUrl = 'https://nayakitab.iwengineering.com/api';

  static const String loginApi = '$_baseUrl/auth/login';

  static String getItemsApi(int? id) => '$_baseUrl/salespoint/$id/items';

  static Future<ResponseWrapper> get(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: NetworkConfig.headersWith(),
      );
      return _response(response);
    } on SocketException {
      return ResponseWrapper(ResponseWrapper.ERROR, null, 'No Internet connection');
    } catch (e) {
      return ResponseWrapper(ResponseWrapper.ERROR, null, 'No Internet connection');
    }
  }

  static Future<ResponseWrapper> post(String url, Object? data) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: NetworkConfig.headersWith(),
        encoding: Encoding.getByName("utf-8"),
      );
      return _response(response);
    } on Exception catch (e) {
      return ResponseWrapper(ResponseWrapper.ERROR, null, '$e');
    } catch (e) {
      return ResponseWrapper(ResponseWrapper.ERROR, null, '$e');
    }
  }

  static ResponseWrapper _response(http.Response response) {
    loggerE(
      "API RESPONSE: " +
          response.statusCode.toString() +
          " -> " +
          response.request!.url.toString() +
          "\n" +
          response.body.toString(),
    );
    Map resMap = json.decode(response.body.toString());

    switch (response.statusCode) {
      case 200:
        return ResponseWrapper(ResponseWrapper.COMPLETED, jsonDecode(response.body), "");
      default:
        if (resMap.containsKey("errors")) {
          String allError = "";
          for (dynamic val in resMap['errors'].values) {
            allError = allError + val.toString() + "\n";
          }
          allError = allError.trim();
          return ResponseWrapper(ResponseWrapper.ERROR, response.body.toString(), allError);
        } else {
          return ResponseWrapper(ResponseWrapper.ERROR, response.body.toString(), resMap['message']);
        }
    }
  }
}
