import 'package:logger/logger.dart';

import '../di/get_it.dart';

Logger get logger => getIt<Logger>();

// note(gprachan) Changes for production
bool get loggerEnabled => false;

void loggerD(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  if (loggerEnabled) logger.d(message, error, stackTrace);
}

void loggerE(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  if (loggerEnabled) logger.e(message, error, stackTrace);
}
