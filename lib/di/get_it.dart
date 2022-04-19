import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:salespoint_flutter/api/api_provider.dart';
import 'package:salespoint_flutter/api/config.dart';
import 'package:salespoint_flutter/data/Prefs.dart';
import 'package:salespoint_flutter/data/app_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/navigation_service.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt(SharedPreferences sharedPreferences, {required bool showAlice}) async {
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<Prefs>(Prefs());
  getIt.registerSingleton<Logger>(Logger());
  getIt.registerLazySingleton<Alice>(() => getAlice());
  getIt.registerFactory<Dio>(() => getDio(showAlice));

  getIt.registerLazySingleton(() => NavigationService());

  getIt.registerFactory<AppApiClient>(() => AppApiClient(
        getIt<Dio>(),
        baseUrl: ApiProvider.baseUrl,
      ));
}

Alice getAlice() => Alice(
      showNotification: true,
      showInspectorOnShake: true,
      darkTheme: false,
      navigatorKey: getIt<NavigationService>().navigatorKey,
      maxCallsCount: 1000,
    );

Dio getDio(bool showAlice) {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiProvider.baseUrl,
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ),
  );

  _dio.options.headers.addAll(NetworkConfig.headersWith());
  if (showAlice) {
    _dio.interceptors.addAll({getIt<Alice>().getDioInterceptor()});
  }
  return _dio;
}
