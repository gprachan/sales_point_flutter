import 'package:flutter/material.dart';
import 'package:salespoint_flutter/data/Prefs.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/theme/colors.dart';
import 'package:salespoint_flutter/ui/book_listing/book_listing_page.dart';
import 'package:salespoint_flutter/ui/login/login_page.dart';
import 'package:salespoint_flutter/ui/school/school_listing_page.dart';
import 'package:salespoint_flutter/utils/alert_utils.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const routeName = 'routeDashboardPage';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                AlertUtils.showCancelDialog(
                  context,
                  'Logout',
                  'Do you want to log out?',
                  'Log out',
                  onClick: () async {
                    await getIt<Prefs>().logout();
                    Navigator.pushReplacementNamed(context, LoginPage.routeName);
                  },
                );
              },
              icon: const Icon(
                Icons.login,
                color: AppColors.primaryColor,
              ),
            ),
          ],
          title: const Text(
            'Transactions',
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
            indicatorColor: AppColors.primaryColor,
            tabs: [
              Tab(
                child: Text(
                  'Book Listing',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'School Listing',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BookListingPage(),
            SchoolListingPage(),
          ],
        ),
      ),
    );
  }
}
