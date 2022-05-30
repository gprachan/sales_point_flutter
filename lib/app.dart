import 'package:flutter/material.dart';
import 'package:salespoint_flutter/AppConstants.dart';
import 'package:salespoint_flutter/data/Prefs.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/routes/route_generator.dart';
import 'package:salespoint_flutter/service/navigation_service.dart';
import 'package:salespoint_flutter/theme/colors.dart';
import 'package:salespoint_flutter/ui/delivery_ui/dashboard/delivery_dashboard_page.dart';
import 'package:salespoint_flutter/ui/delivery_ui/order/order_page.dart';

import 'ui/salespoint_ui/dashboard/dashboard_page.dart';
import 'ui/salespoint_ui/login/login_page.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _prefs = getIt<Prefs>();

  String _initialRoute() {
    if (_prefs.accessToken.isEmpty) {
      return LoginPage.routeName;
    } else if (_prefs.accessToken.isNotEmpty && _prefs.loginData?.user?.type == AppConstants.deliveryUser) {
      return OrderPage.routeName;
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
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.scaffoldColor,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.primaryColor),
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
