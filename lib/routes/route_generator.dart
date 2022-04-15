import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salespoint_flutter/models/response/items_list_response.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_controller.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_page.dart';
import 'package:salespoint_flutter/ui/login/login_page.dart';
import 'package:salespoint_flutter/ui/school/school_controller.dart';
import 'package:salespoint_flutter/ui/student/student_listing_page.dart';

import '../ui/student/student_controller.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case LoginPage.routeName:
            return const LoginPage();
          case DashboardPage.routeName:
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => DashboardController()),
                ChangeNotifierProvider(create: (_) => SchoolController()),
              ],
              child: const DashboardPage(),
            );
          case StudentListingPage.routeName:
            ItemListData? data = settings.arguments as ItemListData?;
            return ChangeNotifierProvider(
              create: (_) => StudentController(selectedItem: data),
              child: const StudentListingPage(),
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
