import 'package:retrofit/retrofit.dart';

import 'error_handler.dart';
import 'logger.dart';

Future<BaseResponse<T>> doTryCatch<T>(
  Future<BaseResponse<T>> Function() task,
) async {
  try {
    return await task();
  } on Exception catch (ex, stacktrace) {
    loggerE("""Exception occurred: 
    $ex 
    stackTrace: 
    $stacktrace""");
    return BaseResponse<T>()..setError(ex.handleError());
  } catch (error) {
    return BaseResponse<T>()..setError(ApiError(error.toString()));
  }
}

extension HandleResponse<T> on HttpResponse<T> {
  BaseResponse<T> handleResponse({Function(T)? onSuccess}) {
    if (data != null) {
      onSuccess?.call(data);
      return BaseResponse<T>()..setData(data);
    } else {
      return BaseResponse<T>()
        ..setError(ApiError(
          "Data not found!",
          code: response.statusCode,
        ));
    }
  }
}

/// Reference: https://medium.com/globant/easy-way-to-implement-rest-api-calls-in-flutter-9859d1ab5396
class BaseResponse<T> {
  ApiError? _error;

  T? data;

  //bool hasError() => _error != null;

  ApiError? get error => _error;

  String? get errorMessage => _error?.message;

  Map<String, List<String>?>? get errors => _error?.errors;

  setError(ApiError? error) {
    _error = error;
  }

  setData(T data) {
    this.data = data;
  }

  toLoggerE(Map<String, dynamic>? data) {
    loggerE("""
    result=${toString()}
    data=$data
    error=${error?.toJson()}
    """);
  }
}
