import 'package:flutter/material.dart';
import 'package:salespoint_flutter/api/response_wrapper.dart';
import 'package:salespoint_flutter/data/Prefs.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/models/request/return_items_request.dart';
import 'package:salespoint_flutter/models/response/items_list_response.dart';
import 'package:salespoint_flutter/utils/logger.dart';

import '../../api/api_provider.dart';

class DashboardController extends ChangeNotifier {
  final _prefs = getIt<Prefs>();

  DashboardController({bool getItems = true}) {
    if (getItems) this.getItems();
  }

  String? _error;
  List<ItemListData>? _items;

  String? get error => _error;

  List<ItemListData>? get items => _items;

  Future<void> getItems() async {
    var response = await ApiProvider.get(ApiProvider.getItemsApi(_prefs.salesPointId));
    if (response.status == ResponseWrapper.COMPLETED) {
      ItemsListResponse? data = ItemsListResponse.fromJson(response.data);
      if (data.data?.isNotEmpty == true) {
        _items = data.data;
      } else {
        _error = "No items found";
      }
    } else {
      _error = response.message;
    }
    notifyListeners();
  }

  List<ReturnItemsDetail> _selectedItems = List.of([]);

  List<ReturnItemsDetail> get selectedItems => _selectedItems;

  void setItemSelected(ItemListData data, {bool onSelectAll = false}) {
    ReturnItemsDetail detail = ReturnItemsDetail(
      itemId: data.id,
      quantity: int.tryParse(data.quantity.toString()) ?? 0,
    );
    if (_selectedItems.map((e) => e.itemId).contains(detail.itemId)) {
      if (!onSelectAll) {
        _selectedItems.removeWhere((element) => element.itemId == detail.itemId);
      }
    } else {
      _selectedItems.add(detail);
    }
    _selectedItems = _selectedItems;
    notifyListeners();
  }

  void onSelectAll() {
    if (items?.isNotEmpty == true) {
      items?.forEach((data) {
        setItemSelected(data, onSelectAll: true);
      });
    }
  }
}
