import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/api/api_provider.dart';
import 'package:salespoint_flutter/api/response_wrapper.dart';
import 'package:salespoint_flutter/data/app_api.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/models/create_bill_share_data.dart';
import 'package:salespoint_flutter/models/request/bill_generate_item.dart';
import 'package:salespoint_flutter/models/response/school_listing_response.dart';
import 'package:salespoint_flutter/models/response/student_listing_response.dart';
import 'package:salespoint_flutter/utils/logger.dart';
import 'package:salespoint_flutter/utils/response_handler.dart';

import '../../models/response/items_list_response.dart';

class SchoolController extends ChangeNotifier {
  final apiClient = getIt<AppApiClient>();

  SchoolController() {
    // getSchools();
    getSchoolListing();
  }

  String? _error;
  List<SchoolListingResponse>? _schools;

  String? get error => _error;

  List<SchoolListingResponse>? get schools => _schools;

  Future<void> getSchoolListing() async {
    BaseResponse<List<SchoolListingResponse>> result = await doTryCatch(() async {
      HttpResponse<List<SchoolListingResponse>> response = await apiClient.getSchoolListing();
      return response.handleResponse();
    });
    if (result.error == null) {
      List<SchoolListingResponse> schoolWithGrades = List.of([]);
      result.data?.forEach((element) {
        if (element.grades != null && element.grades?.isNotEmpty == true) {
          schoolWithGrades.add(element);
        }
      });
      _schools = schoolWithGrades;
    } else {
      _error = error;
    }
    notifyListeners();
  }

  Future<BaseResponse<StudentListingResponse>> getStudents({
    int? page,
    required CreateBillShareData? data,
  }) async {
    return await doTryCatch(() async {
      HttpResponse<StudentListingResponse> response = await apiClient.getStudentListing(
        data?.gradeId,
        data?.schoolId,
        page,
      );
      return response.handleResponse();
    });
  }

  List<BillGenerateItem> _selectedItems = List.from([]);

  List<BillGenerateItem> get selectedItems => _selectedItems;

  List<ItemListData> _mySelectedItems = List.of([]);

  List<ItemListData> get mySelectedItems => _mySelectedItems;

  void updateData(ItemListData data) {
    // description, price, discount_amount, quality, totalAmount, discountPercent
    BillGenerateItem item = BillGenerateItem(
        itemId: data.id,
        name: data.name,
        quantity: 1,
        description: '',
        price: 20,
        discountAmount: 0,
        totalAmount: 20,
        discountPercent: 0);
    if (_selectedItems.contains(item)) {
      _selectedItems.removeWhere((element) => element.itemId == item.itemId);
      _mySelectedItems.removeWhere((element) => element.id == data.id);
    } else {
      _selectedItems.add(item);
      _mySelectedItems.add(data);
    }
    _selectedItems = _selectedItems;
    _mySelectedItems = _mySelectedItems;
    notifyListeners();
  }
}
