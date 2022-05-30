import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/api/api_provider.dart';
import 'package:salespoint_flutter/models/response/common_response.dart';
import 'package:salespoint_flutter/models/response/deliver_dashboard_summary_response.dart';
import 'package:salespoint_flutter/models/response/order_listing_response.dart';

part 'helper_api.g.dart';

/// flutter pub run build_runner build --delete-conflicting-outputs
@RestApi(baseUrl: ApiProvider.baseUrl)
abstract class HelperApiClient {
  factory HelperApiClient(Dio dio, {String? baseUrl}) = _HelperApiClient;

  static const _basePath = 'api';

  static const String _orderListingApi = "$_basePath/delivery-person-orders";
  static const String _updateOrderApi = "$_basePath/delivery-person-status/{orderId}";
  static const String _dashboardSummaryApi = "$_basePath/dashboard/summary";

  @GET(_orderListingApi)
  Future<HttpResponse<List<OrderListingResponse>>> getOrders();

  @POST(_updateOrderApi)
  Future<HttpResponse<CommonResponse>> updateOrderStatus({@Path('orderId') int? orderId});

  @GET(_dashboardSummaryApi)
  Future<HttpResponse<DeliverDashboardSummaryResponse>> getDashboardSummary();
}
