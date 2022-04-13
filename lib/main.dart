import 'package:flutter/material.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt(await SharedPreferences.getInstance());

  runApp(MyApp());
}
