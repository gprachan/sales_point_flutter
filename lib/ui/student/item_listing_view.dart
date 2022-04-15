import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/common/custom_button.dart';
import 'package:salespoint_flutter/data/Prefs.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/models/request/create_bill_request.dart';
import 'package:salespoint_flutter/models/response/create_bill_response.dart';
import 'package:salespoint_flutter/models/response/student_listing_response.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_page.dart';
import 'package:salespoint_flutter/ui/school/school_controller.dart';

import '../../data/app_api.dart';
import '../../models/response/items_list_response.dart';
import '../../utils/alert_utils.dart';
import '../../utils/response_handler.dart';
import '../dashboard/dashboard_controller.dart';

class ItemListingView extends StatelessWidget {
  ItemListingView({
    Key? key,
    this.data,
  }) : super(key: key);

  static const routeName = 'routeNameItemListingView';
  final _formKey = GlobalKey<FormState>();
  final _prefs = getIt<Prefs>();
  final _api = getIt<AppApiClient>();
  final Map<String, dynamic>? data;
  final totalController = TextEditingController();

  void _onGenerateBill(
    BuildContext context,
    SchoolController controller,
  ) async {
    AlertUtils.showProgressDialog(context);
    try {
      if (_formKey.currentState!.validate()) {
        CreateBillRequest request = CreateBillRequest(
          totalAmount: int.tryParse(totalController.text),
          totalQuantity: 1,
          orderDate: DateTime.now().toString(),
          schoolId: data?['schoolId'],
          gradeId: data?['gradeId'],
          studentId: data?['studentId'],
          two: 5,
          fullName: data?['studentName'],
          salesPointId: _prefs.salesPointId,
          studentAddressId: data?['addressId'],
          billItems: controller.selectedItems,
          deliveryType: 'express',
        );

        var response = await doTryCatch(() async {
          HttpResponse<CreateBillResponse> response = await _api.generateBill(request);
          return response.handleResponse();
        });
        Navigator.pop(context);
        if (response.errorMessage == null) {
          Fluttertoast.showToast(msg: 'Bill Generated!');
          Navigator.pushNamedAndRemoveUntil(context, DashboardPage.routeName, (route) => false);
        } else {
          Fluttertoast.showToast(msg: response.errorMessage ?? 'Something went wrong try again!');
        }
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: '$e!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final schoolController = Provider.of<SchoolController>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Books',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Consumer<DashboardController>(
        builder: (context, controller, child) {
          List<ItemListData> items = controller.items ?? [];
          if (items.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _BookItem(
                        item: items[index],
                        isSelected: schoolController.mySelectedItems.contains(items[index]),
                        onClick: (data) {
                          schoolController.updateData(data);
                        },
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: schoolController.selectedItems.isNotEmpty,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: TextFormField(
                            controller: totalController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Enter total amount',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty == true) {
                                return 'Total is required!';
                              }
                              if (int.tryParse(value.toString()) == null) {
                                return 'Invalid price!';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                            onClick: () {
                              _onGenerateBill(context, schoolController);
                            },
                            label: 'Generate Bill'),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          if (controller.error != null) {
            return Center(
              child: Column(
                children: [
                  Text(
                    controller.error ?? 'Something went wrong!',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Refresh'),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}

class _BookItem extends StatelessWidget {
  const _BookItem({
    Key? key,
    required this.item,
    required this.onClick,
    required this.isSelected,
  }) : super(key: key);

  final ItemListData item;
  final bool isSelected;
  final Function(ItemListData data) onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(item);
      },
      child: Container(
        color: isSelected ? const Color(0xffc6efff) : Colors.transparent,
        child: Column(
          children: [
            ListTile(
              title: Text('${item.name}'),
              trailing: Icon(isSelected ? Icons.check_box : Icons.check_box_outline_blank_sharp),
            ),
            const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
