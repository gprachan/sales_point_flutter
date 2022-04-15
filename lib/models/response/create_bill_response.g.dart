// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_bill_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBillResponse _$CreateBillResponseFromJson(Map<String, dynamic> json) =>
    CreateBillResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateBillResponseToJson(CreateBillResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      billId: json['bill_id'] as String?,
      totalAmount: json['total_amount'] as int?,
      totalQuantity: json['total_quantity'] as int?,
      orderDate: json['order_date'] as String?,
      deliveryType: json['delivery_type'] as String?,
      fullName: json['full_name'] as String?,
      schoolId: json['school_id'] as int?,
      gradeId: json['grade_id'] as int?,
      studentId: json['student_id'] as int?,
      salesPointId: json['sales_point_id'] as int?,
      studentAddressId: json['student_address_id'],
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'bill_id': instance.billId,
      'total_amount': instance.totalAmount,
      'total_quantity': instance.totalQuantity,
      'order_date': instance.orderDate,
      'delivery_type': instance.deliveryType,
      'full_name': instance.fullName,
      'school_id': instance.schoolId,
      'grade_id': instance.gradeId,
      'student_id': instance.studentId,
      'sales_point_id': instance.salesPointId,
      'student_address_id': instance.studentAddressId,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
