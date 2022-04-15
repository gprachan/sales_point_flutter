// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAddressResponse _$CreateAddressResponseFromJson(
        Map<String, dynamic> json) =>
    CreateAddressResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateAddressResponseToJson(
        CreateAddressResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      addressDetail: json['address_detail'] as String?,
      studentId: json['student_id'] as int?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'address_detail': instance.addressDetail,
      'student_id': instance.studentId,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
