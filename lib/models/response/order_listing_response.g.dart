// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_listing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListingResponse _$OrderListingResponseFromJson(
        Map<String, dynamic> json) =>
    OrderListingResponse(
      id: json['id'] as int?,
      billId: json['bill_id'] as String?,
      orderDate: json['order_date'] as String?,
      totalAmount: (json['total_amount'] as num?)?.toDouble(),
      studentId: json['student_id'] as int?,
      schoolId: json['school_id'] as int?,
      gradeId: json['grade_id'] as int?,
      fullName: json['full_name'] as String?,
      deliveryType: json['delivery_type'] as String?,
      totalQuantity: json['total_quantity'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      salesPointId: json['sales_point_id'] as int?,
      studentAddressId: json['student_address_id'] as int?,
      statusId: json['status_id'] as int?,
      deliveryCharge: (json['delivery_charge'] as num?)?.toDouble(),
      deliveryPersonId: json['delivery_person_id'] as int?,
    );

Map<String, dynamic> _$OrderListingResponseToJson(
        OrderListingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bill_id': instance.billId,
      'order_date': instance.orderDate,
      'total_amount': instance.totalAmount,
      'student_id': instance.studentId,
      'school_id': instance.schoolId,
      'grade_id': instance.gradeId,
      'full_name': instance.fullName,
      'delivery_type': instance.deliveryType,
      'total_quantity': instance.totalQuantity,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'sales_point_id': instance.salesPointId,
      'student_address_id': instance.studentAddressId,
      'status_id': instance.statusId,
      'delivery_charge': instance.deliveryCharge,
      'delivery_person_id': instance.deliveryPersonId,
    };
