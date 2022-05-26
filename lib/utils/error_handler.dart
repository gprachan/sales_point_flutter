import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salespoint_flutter/ui/salespoint_ui/login/login_page.dart';

import '../data/Prefs.dart';
import '../di/get_it.dart';
import '../models/error_response.dart';
import '../service/navigation_service.dart';
import 'logger.dart';

part 'error_handler.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class ApiError implements Exception {
  int? code;
  String? message;
  Map<String, List<String>?>? errors;

  ApiError(this.message, {this.code, this.errors});

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}

extension LogException on Exception {
  logException(Object? error, StackTrace stackTrace) {
    loggerE("Exception occurred: $error stackTrace: $stackTrace");
  }

  logExceptionStackTrace(stackTrace) {
    loggerE("Exception stackTrace: $stackTrace");
  }
}

extension ErrorHandler on Exception {
  ApiError handleError({defaultError = 'Something went wrong try again!'}) {
    String _errorMessage = 'Unknown error!';
    Map<String, List<String>?>? _errors;
    int? _errorCode;
    if (this is DioError) {
      var error = this as DioError;
      _errorCode = error.response?.statusCode;
      var prefs = getIt<Prefs>();
      if (prefs.accessToken.isNotEmpty && _errorCode == HttpStatusCodes.unauthorized) {
        prefs.logout().then((value) {
          getIt<NavigationService>().navigateTo(LoginPage.routeName);
        });
        return ApiError('Unauthorized user!', code: _errorCode, errors: _errors);
      }
      switch (error.type) {
        case DioErrorType.cancel:
          _errorMessage = "Request was cancelled";
          break;
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          _errorMessage = "Connection timeout!";
          break;
        case DioErrorType.response:
          try {
            var errorBody = error.response?.data;
            var errorResponse = ErrorResponse.fromJson(errorBody);
            _errors = errorResponse.errors;
            _errorMessage = errorResponse.getErrorMessage(defaultError);
          } catch (ex) {
            _errorMessage = 'Something went wrong try again!';
          }
          break;
        case DioErrorType.other:
          if (error.message.contains('SocketConnectionException') || error.message.contains('SocketException')) {
            _errorMessage = "Can't connect to server";
          } else {
            _errorMessage = error.error.toString();
          }
          break;
      }
    } else {
      _errorMessage = toString();
    }
    return ApiError(_errorMessage, code: _errorCode, errors: _errors);
  }
}

/// For more codes: https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
class HttpStatusCodes {
  // informational responses
  static const continue_ = 100;

  // successful responses
  static const ok = 200;
  static const created = 201;
  static const accepted = 201;

  // redirection messages
  static const multipleChoice = 300;
  static const movedPermanently = 301;

  //client error codes
  static const badRequest = 400;
  static const unauthorized = 401;
  static const paymentRequired = 402;
  static const forbidden = 403;
  static const notFound = 404;
  static const methodNotAllowed = 405;
  static const proxyAuthenticationRequired = 407;
  static const requestTimeout = 408;
  static const conflict = 409;
  static const unProcessableEntity = 422; // validation error code
  static const tooManyRequests = 429;

  // server error responses
  static const internalServerError = 500;
  static const notImplemented = 501;
}
