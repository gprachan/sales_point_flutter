// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliver_dashboard_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliverDashboardSummaryResponse _$DeliverDashboardSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    DeliverDashboardSummaryResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeliverDashboardSummaryResponseToJson(
        DeliverDashboardSummaryResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      projectsCount: json['projects_count'] as int?,
      formsCount: json['forms_count'] as int?,
      webUserCount: json['web_user_count'] as int?,
      mobileUserCount: json['mobile_user_count'] as int?,
      totalCustomers: json['total_customers'] as String?,
      totalSales: json['total_sales'] as int?,
      totalOrderCount: json['total_order_count'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'projects_count': instance.projectsCount,
      'forms_count': instance.formsCount,
      'web_user_count': instance.webUserCount,
      'mobile_user_count': instance.mobileUserCount,
      'total_customers': instance.totalCustomers,
      'total_sales': instance.totalSales,
      'total_order_count': instance.totalOrderCount,
    };
