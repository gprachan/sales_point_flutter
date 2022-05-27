import 'package:flutter/material.dart';
import 'package:salespoint_flutter/common/clickables.dart';
import 'package:salespoint_flutter/theme/typography.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  static const routeName = 'routeNameOrderPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Listing'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.separated(
          itemBuilder: (context, index) {
            return _OrderItem(
              onShowBottomSheet: (value) {
                showBottomSheet(context);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemCount: 12,
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Update Order",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
          );
        });
  }
}

typedef OnShowBottomSheet = Function(String? data)?;

class _OrderItem extends StatelessWidget {
  const _OrderItem({
    Key? key,
    this.onShowBottomSheet,
  }) : super(key: key);

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
                    'Book name',
                    style: AppTypography.titleStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(16)),
                    child: const Text(
                      'STATUS',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Available Books: 123',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Type: Location',
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
