import 'package:flutter/material.dart';
import 'package:salespoint_flutter/data/Prefs.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/routes/route_generator.dart';
import 'package:salespoint_flutter/service/navigation_service.dart';
import 'package:salespoint_flutter/theme/colors.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_page.dart';
import 'package:salespoint_flutter/ui/login/login_page.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _prefs = getIt<Prefs>();

  String _initialRoute() {
    if (_prefs.accessToken.isEmpty) {
      return LoginPage.routeName;
    } else {
      return DashboardPage.routeName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Point',
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: const Color(0xfff8f0d4),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xfff8f0d4),
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54, width: 1.0),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(30),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54, width: 1.0),
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIconColor: AppColors.primaryColor.withAlpha(1000),
          prefixIconColor: AppColors.primaryColor.withAlpha(1000),
          filled: true,
          fillColor: Colors.white70,
        ),
      ),
      initialRoute: _initialRoute(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
