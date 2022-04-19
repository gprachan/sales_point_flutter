import 'dart:convert';
import 'dart:io';

import 'package:salespoint_flutter/api/config.dart';
import 'package:salespoint_flutter/api/response_wrapper.dart';

import 'package:http/http.dart' as http;
import 'package:salespoint_flutter/data/Prefs.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/utils/logger.dart';

import '../service/navigation_service.dart';
import '../ui/login/login_page.dart';

class ApiProvider {
  static const String _productionBaseUrl = 'https://api.nayakitab.com/';
  static const String _stageBaseUrl = 'https://nayakitab.iwengineering.com/';
  static const String baseUrl = _productionBaseUrl;
  static const String _serverUrl = baseUrl + 'api';

  static const String loginApi = '$_serverUrl/auth/login';
  static const String salesPointBillApi = '$_serverUrl/api/sales-point-bill';
  static const String schoolListingApi = '$_serverUrl/school';

  static String getItemsApi(int? id) => '$_serverUrl/salespoint/$id/items';

  static String getBillsApi(int? id) => '$_serverUrl/salespoint/$id/bills';

  static String getReturnItemsApi(int? id) => '$_serverUrl/salespoint/$id/return-items';

  static Future<ResponseWrapper> get(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: NetworkConfig.headersWith(),
      );
      // .interceptWithAlice(getIt<Alice>());
      return _response(response);
    } on SocketException {
      return ResponseWrapper(ResponseWrapper.ERROR, null, 'No Internet connection');
    } catch (e) {
      return ResponseWrapper(ResponseWrapper.ERROR, null, '$e');
    }
  }

  static Future<ResponseWrapper> post(String url, Object? data) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: NetworkConfig.headersWith(),
        // encoding: Encoding.getByName("utf-8"),
      );
      // .interceptWithAlice(getIt<Alice>(), body: data);

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
    try {
      switch (response.statusCode) {
        case 200:
          return ResponseWrapper(ResponseWrapper.COMPLETED, jsonDecode(response.body), "");
        case 401:
          if (getIt<Prefs>().accessToken.isNotEmpty) {
            getIt<Prefs>().logout().then((value) {
              getIt<NavigationService>().navigateTo(LoginPage.routeName);
            });
          }
          return ResponseWrapper(ResponseWrapper.ERROR, response.body.toString(), 'Unauthorized user!');
        default:
          Map resMap = jsonDecode(response.body);
          if (resMap.containsKey("errors")) {
            String allError = "";
            for (dynamic val in resMap['errors'].values) {
              allError = allError + val.toString() + "\n";
            }
            allError = allError.trim();
            return ResponseWrapper(ResponseWrapper.ERROR, response.body.toString(), allError);
          }
          if (resMap.containsKey("error")) {
            return ResponseWrapper(ResponseWrapper.ERROR, response.body.toString(), resMap['error']);
          } else {
            return ResponseWrapper(ResponseWrapper.ERROR, response.body.toString(), resMap['message']);
          }
      }
    } catch (e) {
      return ResponseWrapper(ResponseWrapper.ERROR, response.body.toString(), '$e');
    }
  }
}
