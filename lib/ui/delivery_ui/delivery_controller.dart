import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/data/helper_api.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/models/response/common_response.dart';
import 'package:salespoint_flutter/utils/logger.dart';
import 'package:salespoint_flutter/utils/response_handler.dart';

class DeliveryController extends ChangeNotifier {
  final _apiClient = getIt<HelperApiClient>();

  String? _error;

  String? get error => _error;

  Future<void> getOrders() async {
    BaseResponse<List<CommonResponse>> result = await doTryCatch(() async {
      HttpResponse<List<CommonResponse>> response = await _apiClient.getOrders();
      return response.handleResponse();
    });
    if (result.errorMessage == null) {
      var data = result.data ?? [];
      if (data.isNotEmpty) {
      } else {
        _error = 'No data orders found!';
      }
    } else {
      _error = result.errorMessage;
    }
    notifyListeners();
  }

  Future<String?> updateOrderState() async {
    BaseResponse<CommonResponse> result = await doTryCatch(() async {
      HttpResponse<CommonResponse> response = await _apiClient.updateOrderStatus(orderId: 0);
      return response.handleResponse();
    });
    return result.errorMessage;
  }
}
