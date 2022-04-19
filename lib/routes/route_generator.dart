import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salespoint_flutter/models/create_bill_share_data.dart';
import 'package:salespoint_flutter/models/response/items_list_response.dart';
import 'package:salespoint_flutter/ui/book_listing/book_listing_page.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_controller.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_page.dart';
import 'package:salespoint_flutter/ui/login/login_page.dart';
import 'package:salespoint_flutter/ui/school/school_controller.dart';
import 'package:salespoint_flutter/ui/student/item_listing_view.dart';

import '../ui/student/student_listing_page.dart';

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
            CreateBillShareData? data = settings.arguments as CreateBillShareData?;
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => SchoolController()),
                ChangeNotifierProvider(create: (_) => DashboardController()),
              ],
              child: StudentListingPage(
                data: data,
              ),
            );
          case ItemListingView.routeName:
            Map<String, dynamic>? data = settings.arguments as Map<String, dynamic>?;
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => SchoolController()),
                ChangeNotifierProvider(
                  create: (_) => DashboardController(
                    getItems: false,
                    itemsBySchool: true,
                    data:data,
                  ),
                ),
              ],
              child: ItemListingView(data: data),
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
