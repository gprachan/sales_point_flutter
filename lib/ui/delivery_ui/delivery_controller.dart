import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/data/helper_api.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/models/request/update_order_status_request.dart';
import 'package:salespoint_flutter/models/response/common_response.dart';
import 'package:salespoint_flutter/models/response/deliver_dashboard_summary_response.dart';
import 'package:salespoint_flutter/models/response/order_listing_response.dart';
import 'package:salespoint_flutter/models/response/order_status_response.dart';
import 'package:salespoint_flutter/utils/logger.dart';
import 'package:salespoint_flutter/utils/response_handler.dart';

class DeliveryController extends ChangeNotifier {
  final _apiClient = getIt<HelperApiClient>();

  String? _error;

  String? get error => _error;

  List<OrderStatusResponse>? _orderStatus;

  String? getStatus(int? status) {
    if (status == null || _orderStatus?.isEmpty == true) {
      return 'Undefined';
    }
    return _orderStatus?.firstWhere((element) => element.id == status).name;
  }

  Future<void> getStatusListing() async {
    BaseResponse<List<OrderStatusResponse>> result = await doTryCatch(() async {
      HttpResponse<List<OrderStatusResponse>> response = await _apiClient.getOrderStatus();
      return response.handleResponse();
    });
    _orderStatus = result.data;
    getOrders();
  }

  List<OrderListingResponse>? _orders;

  List<OrderListingResponse> get orders => _orders ?? [];

  // Get list of orders for delivery boy
  Future<void> getOrders() async {
    BaseResponse<List<OrderListingResponse>> result = await doTryCatch(() async {
      HttpResponse<List<OrderListingResponse>> response = await _apiClient.getOrders();
      return response.handleResponse();
    });
    if (result.errorMessage == null) {
      var data = result.data ?? [];
      if (data.isNotEmpty) {
        _orders = data;
      } else {
        _error = 'No data orders found!';
      }
    } else {
      _error = result.errorMessage;
    }
    loggerE('Error message ${result.errorMessage}');
    notifyListeners();
  }

  // Update order status by delivery boy
  Future<String?> updateOrderState(int? orderId, UpdateOrderStatusRequest request) async {
    BaseResponse<CommonResponse> result = await doTryCatch(() async {
      HttpResponse<CommonResponse> response = await _apiClient.updateOrderStatus(orderId: orderId, request: request);
      return response.handleResponse();
    });
    return result.errorMessage;
  }

  DeliverDashboardSummaryResponse? _dashboardData;

  DeliverDashboardSummaryResponse? get dashboardData => _dashboardData;

  // Get dashboard summary for delivery body
  Future<void> getDashboardSummary() async {
    BaseResponse<DeliverDashboardSummaryResponse> result = await doTryCatch(() async {
      HttpResponse<DeliverDashboardSummaryResponse> response = await _apiClient.getDashboardSummary();
      return response.handleResponse();
    });

    if (result.errorMessage == null) {
      _dashboardData = result.data;
    } else {
      _error = result.errorMessage;
    }
  }
}
