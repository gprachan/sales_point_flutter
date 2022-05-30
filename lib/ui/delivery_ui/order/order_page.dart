import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salespoint_flutter/common/clickables.dart';
import 'package:salespoint_flutter/common/custom_button.dart';
import 'package:salespoint_flutter/models/response/order_listing_response.dart';
import 'package:salespoint_flutter/theme/typography.dart';
import 'package:salespoint_flutter/ui/delivery_ui/delivery_controller.dart';
import 'package:salespoint_flutter/utils/date_parser.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  static const routeName = 'routeNameOrderPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Listing'),
      ),
      body: Consumer<DeliveryController>(builder: (context, controller, child) {
        if (controller.orders.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              controller.getOrders();
            },
            child: ListView.separated(
              itemBuilder: (context, index) {
                return _OrderItem(
                  item: controller.orders[index],
                  onShowBottomSheet: (value) {
                    showBottomSheet(context);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: controller.orders.length,
            ),
          );
        }
        if (controller.error != null) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                controller.error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }),
    );
  }

  void showBottomSheet(BuildContext buildContext) {
    final description = TextEditingController();
    showModalBottomSheet(
      context: buildContext,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          margin: MediaQuery.of(context).viewInsets,
          padding: const EdgeInsets.all(24),
          child: Wrap(
            runSpacing: 24,
            children: [
              const Text(
                "Update Order",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: description,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "Write short description",
                  alignLabelWithHint: true,
                ),
              ),
              CustomButton(
                onClick: () {
                  Navigator.pop(context);
                },
                label: "UPDATE STATUS",
              ),
            ],
          ),
        );
      },
    );
  }
}

typedef OnShowBottomSheet = Function(String? data)?;

class _OrderItem extends StatelessWidget {
  const _OrderItem({
    Key? key,
    this.onShowBottomSheet,
    required this.item,
  }) : super(key: key);

  final OrderListingResponse item;
  final OnShowBottomSheet onShowBottomSheet;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    item.fullName ?? 'No Name',
                    style: AppTypography.titleStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      '${item.statusId}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Total Amount: Rs. ${item.totalAmount}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Order Date: ${DateParser.formatDate(item.orderDate)}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ClickableText(
                        label: 'Update Status',
                        onClick: () {
                          onShowBottomSheet?.call("Data");
                        },
                      ),
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
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    width: 110,
                    height: 160,
                    child: Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
