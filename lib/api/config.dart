import 'dart:io';

import 'package:salespoint_flutter/data/Prefs.dart';
import 'package:salespoint_flutter/di/get_it.dart';

class NetworkConfig {
  static final _prefs = getIt<Prefs>();
  static const _keyAccessTokenHeader = 'Authorization';

  static final Map<String, String> _httpHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    HttpHeaders.acceptHeader: 'application/json',
    // 'Content-Type': 'application/json'
  };

  static Map<String, String> headersWith() {
    var headers = _httpHeaders;
    if (_prefs.accessToken.isNotEmpty) {
      headers[_keyAccessTokenHeader] = _prefs.accessToken;
    }
    return headers;
  }
}
