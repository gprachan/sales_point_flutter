import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_controller.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_page.dart';
import 'package:salespoint_flutter/ui/login/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case LoginPage.routeName:
            return const LoginPage();
          case DashboardPage.routeName:
            return ChangeNotifierProvider(
              create: (_) => DashboardController(),
              child: const DashboardPage(),
            );
          default:
            return ChangeNotifierProvider(
              create: (_) => DashboardController(),
              child: const DashboardPage(),
            );
        }
      },
    );
  }
}
