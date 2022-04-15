// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_address_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentAddressListResponse _$StudentAddressListResponseFromJson(
        Map<String, dynamic> json) =>
    StudentAddressListResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentAddressListResponseToJson(
        StudentAddressListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

AddressData _$AddressDataFromJson(Map<String, dynamic> json) => AddressData(
      id: json['id'] as int?,
      studentId: json['student_id'] as int?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      addressDetail: json['address_detail'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'address_detail': instance.addressDetail,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
