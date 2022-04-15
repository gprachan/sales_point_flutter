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
        return Column(
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
                    color: const Color(0xffc5f3ca), // const Color(0xffb7e7ee),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                controller.onSelectAll();
                              },
                              child: const Text('Select All'),
                            ),
                            Text('${controller.selectedItems.length} of ${controller.items?.length}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    controller.cancel();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.red, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(width: 12),
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
        color: isSelected ? const Color(0xffc5f3ca) : AppColors.scaffoldColor,
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
                  'https://marketplace.canva.com/EAD7WuSVrt0/1/0/1003w/canva-colorful-illustration-young-adult-book-cover-LVthABb24ik.jpg',
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
