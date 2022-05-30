import 'package:json_annotation/json_annotation.dart';

part 'deliver_dashboard_summary_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class DeliverDashboardSummaryResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'data')
  Data? data;

  DeliverDashboardSummaryResponse({
    this.message,
    this.status,
    this.data,
  });

  factory DeliverDashboardSummaryResponse.fromJson(Map<String, dynamic> json) => _$DeliverDashboardSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeliverDashboardSummaryResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Data {
  @JsonKey(name: 'projects_count')
  int? projectsCount;
  @JsonKey(name: 'forms_count')
  int? formsCount;
  @JsonKey(name: 'web_user_count')
  int? webUserCount;
  @JsonKey(name: 'mobile_user_count')
  int? mobileUserCount;
  @JsonKey(name: 'total_customers')
  String? totalCustomers;
  @JsonKey(name: 'total_sales')
  int? totalSales;
  @JsonKey(name: 'total_order_count')
  int? totalOrderCount;

  Data({
    this.projectsCount,
    this.formsCount,
    this.webUserCount,
    this.mobileUserCount,
    this.totalCustomers,
    this.totalSales,
    this.totalOrderCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
