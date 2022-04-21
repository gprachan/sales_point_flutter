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
import 'package:salespoint_flutter/theme/colors.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_page.dart';
import 'package:salespoint_flutter/ui/school/school_controller.dart';

import '../../data/app_api.dart';
import '../../models/response/item_listing_by_school_response.dart';
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
  final _prefs = getIt<Prefs>();
  final _api = getIt<AppApiClient>();
  final Map<String, dynamic>? data;

  void _onGenerateBill(
    BuildContext context,
    SchoolController controller,
  ) async {
    AlertUtils.showProgressDialog(context);
    try {
      // todo(gprachan) double are rounded up on UI and while sending to server, instead round it during calculation
      // double.tryParse(controller.totalPrice.toStringAsFixed(2)),
      CreateBillRequest request = CreateBillRequest(
        totalAmount: controller.totalPrice.round().toDouble(),
        regularPrice: controller.regularPrice.round().toDouble(),
        totalQuantity: 1,
        orderDate: DateTime.now().toString(),
        schoolId: data?['schoolId'],
        gradeId: data?['gradeId'],
        studentId: data?['studentId'],
        two: 5,
        fullName: data?['studentName'],
        salesPointId: _prefs.salesPointId,
        studentAddressId: data?['addressId'],
        deliveryType: 'express',
        billItems: controller.selectedItems,
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
    } catch (e) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: '$e!');
    }
  }

  Widget totalPrice(SchoolController controller) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        text: "Total Price ",
        children: [
          TextSpan(
            text: controller.totalPrice == controller.regularPrice ? '' : 'Rs. ${controller.regularPrice.round()}',
            style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
          ),
          TextSpan(
            text: controller.totalPrice == controller.regularPrice ? '' : '  |  ',
          ),
          TextSpan(text: 'Rs. ${controller.totalPrice.round()}')
        ],
      ),
    );
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
          List<ItemListingBySchoolResponse> items = controller.itemsBySchool;
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
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.money),
                              ),
                              enabled: false,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 44.0),
                              child: totalPrice(schoolController),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          onClick: () {
                            _onGenerateBill(context, schoolController);
                          },
                          label: 'Generate Bill',
                        ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.error ?? 'Something went wrong!',
                    style: const TextStyle(fontSize: 18, color: Colors.red),
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

  final ItemListingBySchoolResponse item;
  final bool isSelected;
  final Function(ItemListingBySchoolResponse data) onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(item);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                '${item.itemName}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                isSelected ? Icons.check_box : Icons.check_box_outline_blank_sharp,
                color: isSelected ? AppColors.primaryColor : Colors.grey,
              ),
              subtitle: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  text: "PRICE: ",
                  children: [
                    TextSpan(
                      text: ' Rs. ${item.regularPrice?.round()}',
                      style: TextStyle(
                        decoration: item.discount == 0 ? TextDecoration.none : TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                        text: (item.discount ?? 0) > 0
                            ? ' | Rs. ${SchoolController.getDiscountedAmount(item.regularPrice ?? 0, item.discount ?? 0)}'
                            : ''),
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
