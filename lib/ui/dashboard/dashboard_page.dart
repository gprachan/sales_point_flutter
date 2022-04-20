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
            PopupMenuButton(
              itemBuilder: (context) {
                return List.generate(2, (index) {
                  return PopupMenuItem(
                    child: index == 0
                        ? ListTile(
                            title: Text("${getIt<Prefs>().loginData?.user?.name}"),
                            subtitle: Text("${getIt<Prefs>().loginData?.user?.email}"),
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.pop(context);
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
                            child: const ListTile(
                              title: Text('Log out'),
                              leading: Icon(Icons.login),
                            ),
                          ),
                  );
                });
              },
              icon: const Icon(
                Icons.more_vert,
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
