import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salespoint_flutter/models/create_bill_share_data.dart';
import 'package:salespoint_flutter/ui/delivery_ui/dashboard/delivery_dashboard_page.dart';
import 'package:salespoint_flutter/ui/delivery_ui/delivery_controller.dart';
import 'package:salespoint_flutter/ui/delivery_ui/order/order_page.dart';
import 'package:salespoint_flutter/ui/salespoint_ui/add_student/add_student_page.dart';
import 'package:salespoint_flutter/ui/salespoint_ui/dashboard/dashboard_controller.dart';
import 'package:salespoint_flutter/ui/salespoint_ui/dashboard/dashboard_page.dart';
import 'package:salespoint_flutter/ui/salespoint_ui/login/login_page.dart';
import 'package:salespoint_flutter/ui/salespoint_ui/school/school_controller.dart';
import 'package:salespoint_flutter/ui/salespoint_ui/student/item_listing_view.dart';
import 'package:salespoint_flutter/utils/logger.dart';

import '../ui/salespoint_ui/student/student_listing_page.dart';

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
          case AddStudentPage.routeName:
            CreateBillShareData? data = settings.arguments as CreateBillShareData?;
            return AddStudentPage(data: data);
          case ItemListingView.routeName:
            Map<String, dynamic>? data = settings.arguments as Map<String, dynamic>?;
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => SchoolController()),
                ChangeNotifierProvider(
                  create: (_) => DashboardController(
                    getItems: false,
                    itemsBySchool: true,
                    data: data,
                  ),
                ),
              ],
              child: ItemListingView(data: data),
            );

          /// NOTE: Delivery UI
          case DeliveryDashboardPage.routeName:
            return const DeliveryDashboardPage();
          case OrderPage.routeName:
            return ChangeNotifierProvider(
              create: (_) => DeliveryController()..getOrders(),
              child: const OrderPage(),
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
