import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:salespoint_flutter/data/Prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt(SharedPreferences sharedPreferences) async {
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<Prefs>(Prefs());
  getIt.registerSingleton<Logger>(Logger());
}
