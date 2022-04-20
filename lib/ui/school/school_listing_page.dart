import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salespoint_flutter/models/create_bill_share_data.dart';
import 'package:salespoint_flutter/models/response/school_listing_response.dart';
import 'package:salespoint_flutter/theme/colors.dart';
import 'package:salespoint_flutter/ui/school/school_controller.dart';
import 'package:salespoint_flutter/ui/student/student_listing_page.dart';

class SchoolListingPage extends StatelessWidget {
  const SchoolListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SchoolController>(
      builder: (context, controller, child) {
        var items = controller.schools ?? [];
        if (items.isNotEmpty) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              var data = items[index];
              return Card(
                child: ExpansionTile(
                    key: PageStorageKey<SchoolListingResponse>(data),
                    title: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      title: Text('${data.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Text('\n${data.address}\n${data.contactNo}'),
                    ),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 14.0, bottom: 14),
                            child: Text(
                              'Grades',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Divider(height: 0, color: AppColors.primaryColor),
                          Column(
                            children: data.grades!
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        StudentListingPage.routeName,
                                        arguments: CreateBillShareData(
                                          gradeId: e.id,
                                          schoolId: data.id,
                                        ),
                                      );
                                    },
                                    child: ListTile(
                                      title: Text('${e.gradeName}'),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ]),
              );
            },
          );
        }
        if (controller.error != null) {
          return Center(child: Text(controller.error!));
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
