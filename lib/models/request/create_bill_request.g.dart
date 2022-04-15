// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_bill_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBillRequest _$CreateBillRequestFromJson(Map<String, dynamic> json) =>
    CreateBillRequest(
      totalAmount: json['total_amount'] as int?,
      totalQuantity: json['total_quantity'] as int?,
      orderDate: json['order_date'] as String?,
      deliveryType: json['delivery_type'] as String?,
      schoolId: json['school_id'] as int?,
      gradeId: json['grade_id'] as int?,
      studentId: json['student_id'] as int?,
      two: json['2'] as int?,
      fullName: json['full_name'] as String?,
      salesPointId: json['sales_point_id'] as int?,
      studentAddressId: json['student_address_id'] as int?,
      billItems: (json['bill_items'] as List<dynamic>?)
          ?.map((e) => BillGenerateItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateBillRequestToJson(CreateBillRequest instance) =>
    <String, dynamic>{
      'total_amount': instance.totalAmount,
      'total_quantity': instance.totalQuantity,
      'order_date': instance.orderDate,
      'delivery_type': instance.deliveryType,
      'school_id': instance.schoolId,
      'grade_id': instance.gradeId,
      'student_id': instance.studentId,
      '2': instance.two,
      'full_name': instance.fullName,
      'sales_point_id': instance.salesPointId,
      'student_address_id': instance.studentAddressId,
      'bill_items': instance.billItems,
    };
