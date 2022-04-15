// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnItemsResponse _$ReturnItemsResponseFromJson(Map<String, dynamic> json) =>
    ReturnItemsResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReturnItemsResponseToJson(
        ReturnItemsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      location: json['location'] as String?,
      phoneNumber: json['phone_number'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'location': instance.location,
      'phone_number': instance.phoneNumber,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
