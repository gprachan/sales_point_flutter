import 'package:flutter/material.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// note(gprachan) Changes for production
  /// [showAlice] is to hide or show alice for production/staging
  setupGetIt(await SharedPreferences.getInstance(), showAlice: false);

  runApp(MyApp());
}
