import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salespoint_flutter/common/clickables.dart';
import 'package:salespoint_flutter/models/response/items_list_response.dart';
import 'package:salespoint_flutter/theme/colors.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_controller.dart';
import '../../theme/typography.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static const routeName = 'routeDashboardPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              centerTitle: true,
              backgroundColor: const Color(0xfff8f0d4),
              title: const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Book Listing',
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 24),
                ),
              ),
              floating: true,
              // expandedHeight: 80,
              forceElevated: innerBoxIsScrolled,
            )
          ];
        },
        body: Consumer<DashboardController>(builder: (context, controller, child) {
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
                        color: const Color(0xffb7e7ee),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                controller.onSelectAll();
                              },
                              child: const Text('Select All'),
                            ),
                            Text('${controller.selectedItems.length} of ${controller.items?.length}'),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Return'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
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
        }),
      ),
    );
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
        color: isSelected ? const Color(0xffc5f3ca) : Colors.white,
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
                      children: [
                        ClickableText(
                          label: 'Return Book',
                          onClick: () {},
                          color: Colors.red,
                        ),
                        const SizedBox(width: 8),
                        ClickableText(
                          label: 'Send Book',
                          onClick: () {},
                        ),
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
