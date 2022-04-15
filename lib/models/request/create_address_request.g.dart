// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAddressRequest _$CreateAddressRequestFromJson(
        Map<String, dynamic> json) =>
    CreateAddressRequest(
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      addressDetail: json['address_detail'] as String?,
      studentId: json['student_id'] as int?,
    );

Map<String, dynamic> _$CreateAddressRequestToJson(
        CreateAddressRequest instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'address_detail': instance.addressDetail,
      'student_id': instance.studentId,
    };
