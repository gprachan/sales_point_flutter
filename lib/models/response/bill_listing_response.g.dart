// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_listing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillListingResponse _$BillListingResponseFromJson(Map<String, dynamic> json) =>
    BillListingResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BillData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BillListingResponseToJson(
        BillListingResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

BillData _$BillDataFromJson(Map<String, dynamic> json) => BillData(
      id: json['id'] as int?,
      billId: json['bill_id'] as String?,
      orderDate: json['order_date'] as String?,
      totalAmount: json['total_amount'] as int?,
      studentId: json['student_id'] as int?,
      schoolId: json['school_id'] as int?,
      gradeId: json['grade_id'] as int?,
      fullName: json['full_name'] as String?,
      deliveryType: json['delivery_type'] as String?,
      totalQuantity: json['total_quantity'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      salesPointId: json['sales_point_id'] as int?,
      studentAddressId: json['student_address_id'],
      school: json['school'] == null
          ? null
          : School.fromJson(json['school'] as Map<String, dynamic>),
      student: json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillDataToJson(BillData instance) => <String, dynamic>{
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
      'school': instance.school,
      'student': instance.student,
    };

School _$SchoolFromJson(Map<String, dynamic> json) => School(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      contactNo: json['contact_no'] as String?,
      image: json['image'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      gradeId: json['grade_id'],
    );

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'contact_no': instance.contactNo,
      'image': instance.image,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'grade_id': instance.gradeId,
    };

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: json['id'] as int?,
      schoolId: json['school_id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phone_no'] as String?,
      address: json['address'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      gradeId: json['grade_id'] as int?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'school_id': instance.schoolId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_no': instance.phoneNo,
      'address': instance.address,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'grade_id': instance.gradeId,
    };
