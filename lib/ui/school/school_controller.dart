import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/data/app_api.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/models/create_bill_share_data.dart';
import 'package:salespoint_flutter/models/request/bill_generate_item.dart';
import 'package:salespoint_flutter/models/response/school_listing_response.dart';
import 'package:salespoint_flutter/models/response/student_listing_response.dart';
import 'package:salespoint_flutter/utils/response_handler.dart';

import '../../models/response/item_listing_by_school_response.dart';

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

  List<ItemListingBySchoolResponse> _mySelectedItems = List.of([]);

  List<ItemListingBySchoolResponse> get mySelectedItems => _mySelectedItems;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  static int getDiscountedAmount(double totalPrice, double discount) {
    return (totalPrice - ((totalPrice * discount) / 100)).round();
  }

  void updateData(ItemListingBySchoolResponse data) {
    BillGenerateItem item = BillGenerateItem(
      itemId: data.id,
      name: data.itemName,
      quantity: 1,
      description: '',
      price: getDiscountedAmount((data.regularPrice ?? 0), (data.discount ?? 0)),
      discountAmount: data.discountPrice,
      totalAmount: getDiscountedAmount((data.regularPrice ?? 0), (data.discount ?? 0)),
      discountPercent: data.discount,
    );
    if (_mySelectedItems.contains(data)) {
      _selectedItems.removeWhere((element) => element.itemId == item.itemId);
      _mySelectedItems.removeWhere((element) => element.id == data.id);
    } else {
      _selectedItems.add(item);
      _mySelectedItems.add(data);
    }
    _selectedItems = _selectedItems;
    _mySelectedItems = _mySelectedItems;
    notifyListeners();
    _calculatePrice();
  }

  void _calculatePrice() {
    _totalPrice = 0;
    for (var element in _selectedItems) {
      _totalPrice += element.totalAmount ?? 0;
    }
    notifyListeners();
  }
}
