import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:salespoint_flutter/models/request/create_bill_request.dart';
import 'package:salespoint_flutter/models/response/bill_listing_response.dart';
import 'package:salespoint_flutter/models/response/items_list_response.dart';

import '../../api/api_provider.dart';
import '../../api/response_wrapper.dart';
import '../../data/Prefs.dart';
import '../../di/get_it.dart';

class StudentController extends ChangeNotifier {
  final _prefs = getIt<Prefs>();

  StudentController({this.selectedItem}) {
    getBillListing();
  }

  final ItemListData? selectedItem;
  String? _error;
  List<BillData>? _items;

  String? get error => _error;

  List<BillData>? get items => _items;

  Future<void> getBillListing() async {
    var response = await ApiProvider.get(ApiProvider.getBillsApi(_prefs.salesPointId));
    if (response.status == ResponseWrapper.COMPLETED) {
      BillListingResponse? data = BillListingResponse.fromJson(response.data);
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

  Future<String?> createBill(CreateBillRequest request) async {
    var response = await ApiProvider.post(ApiProvider.salesPointBillApi, jsonEncode(request));
    if (response.status == ResponseWrapper.COMPLETED) {
      // BillListingResponse? data = BillListingResponse.fromJson(response.data);
      /*if (data.data?.isNotEmpty == true) {
        _items = data.data;
      } else {
        _error = "No items found";
      }*/
    } else {
      _error = response.message;
    }
    notifyListeners();
  }
}
