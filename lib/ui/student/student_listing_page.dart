import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salespoint_flutter/theme/colors.dart';
import 'package:salespoint_flutter/ui/student/student_controller.dart';

class StudentListingPage extends StatelessWidget {
  const StudentListingPage({Key? key}) : super(key: key);

  static const routeName = 'routeStudentListing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Bills',
        ),
      ),
      body: Consumer<StudentController>(builder: (context, controller, child) {
        var items = controller.items ?? [];
        if (items.isNotEmpty) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('${items[index].billId}'),
              );
            },
          );
        }
        if (controller.error != null) {
          return Center(child: Text(controller.error!));
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      }),
    );
  }
}
