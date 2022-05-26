import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:salespoint_flutter/theme/colors.dart';

import '../../common/clickables.dart';
import '../../models/response/items_list_response.dart';
import '../../theme/styles.dart';
import '../../theme/typography.dart';
import '../../utils/alert_utils.dart';
import '../dashboard/dashboard_controller.dart';

class BookListingPage extends StatelessWidget {
  const BookListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(builder: (context, controller, child) {
      List<ItemListData> items = controller.items ?? [];
      if (items.isNotEmpty) {
        return WillPopScope(
          onWillPop: () async {
            if (controller.selectedItems.isNotEmpty) {
              controller.cancel();
              return false;
            }
            return true;
          },
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _ListItem(
                      data: items[index],
                      isSelected: controller.selectedItems.map((e) => e.itemId).contains(items[index].id),
                      onLongPress: (data) {
                        controller.setItemSelected(data);
                      },
                      onTap: (data) {
                        controller.setItemSelected(data);
                      },
                    );
                  },
                ),
              ),
              Visibility(
                visible: controller.selectedItems.isNotEmpty,
                child: Column(
                  children: [
                    const Divider(height: 0, thickness: 1),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: AppColors.selectedColor,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.selectedItems.length == controller.items?.length
                                          ? controller.cancel()
                                          : controller.onSelectAll();
                                    },
                                    child: Icon(
                                      controller.selectedItems.length == controller.items?.length
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_off,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text('${controller.selectedItems.length} / ${controller.items?.length}'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  /*TextButton(
                                    onPressed: () {
                                      controller.cancel();
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.red, fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(width: 12),*/
                                  ElevatedButton(
                                    style: buttonStyle,
                                    onPressed: () async {
                                      AlertUtils.showProgressDialog(context);
                                      String? error = await controller.returnSelectedItems();
                                      Navigator.pop(context);
                                      if (error == null) {
                                        Fluttertoast.showToast(msg: 'Items returned.');
                                        await controller.getItems();
                                      } else {
                                        AlertUtils.showAlertDialog(context, 'Error', error, 'Ok');
                                      }
                                    },
                                    child: const Text(
                                      'Return Book',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
      if (controller.error != null) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                onPressed: () {
                  controller.getItems();
                },
                child: const Text('Refresh'),
              ),
            ],
          ),
        );
      }
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    });
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.data,
    required this.isSelected,
    required this.onLongPress,
    required this.onTap,
  }) : super(key: key);

  final ItemListData data;
  final Function(ItemListData data) onLongPress;
  final Function(ItemListData data) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        onLongPress(data);
      },
      onTap: () {
        onTap(data);
      },
      child: Card(
        color: isSelected ? AppColors.selectedColor : AppColors.scaffoldColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      data.name ?? 'Book name',
                      style: AppTypography.titleStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Available Books: ${data.quantity}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Type: ${data.type}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        ClickableText(label: 'Return Book', onClick: null),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoCBdaTqCENdnS8TlC-sS-bsXWlWs7o1asyw&usqp=CAU',
                  width: 110,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
