// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      json['error'] as String?,
      (json['detail'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['message'] as String?,
      (json['non_field_errors'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['otp'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['password'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['email'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, (e as List<dynamic>?)?.map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'detail': instance.detail,
      'non_field_errors': instance.nonFieldsError,
      'otp': instance.otp,
      'password': instance.password,
      'email': instance.email,
      'errors': instance.errors,
    };
