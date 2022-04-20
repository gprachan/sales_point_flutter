import 'package:logger/logger.dart';
import 'package:salespoint_flutter/api/api_provider.dart';

import '../di/get_it.dart';

Logger get logger => getIt<Logger>();

bool get loggerEnabled => ApiProvider.showLog();

void loggerD(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  if (loggerEnabled) logger.d(message, error, stackTrace);
}

void loggerE(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  if (loggerEnabled) logger.e(message, error, stackTrace);
}
