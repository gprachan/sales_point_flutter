import 'dart:convert';

import 'package:salespoint_flutter/models/response/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/get_it.dart';

class Prefs {
  final SharedPreferences _prefs = getIt<SharedPreferences>();

  static const String _keyAccessToken = 'keyAccessToken';
  static const String _keyLoginData = 'keyLoginData';

  String get accessToken => _prefs.getString(_keyAccessToken) ?? "";

  set accessToken(String? token) => _prefs.setString(_keyAccessToken, token ?? "");

  LoginResponse? get loginData {
    var responseJsonString = _prefs.getString(_keyLoginData);
    LoginResponse? data = responseJsonString == null ? null : LoginResponse.fromJson(jsonDecode(responseJsonString));
    return data;
  }

  set loginData(LoginResponse? data) {
    String? encodedData = data == null ? null : jsonEncode(data);
    _prefs.setString(_keyLoginData, encodedData ?? "");
  }

  int? get salesPointId => loginData?.user?.salesPointUser?.salesPoint?.id;

  Future<void> logout() async {
    await _prefs.clear();
  }
}
