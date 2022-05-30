// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusResponse _$OrderStatusResponseFromJson(Map<String, dynamic> json) =>
    OrderStatusResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      active: json['active'] as int?,
      status: json['status'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$OrderStatusResponseToJson(
        OrderStatusResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'active': instance.active,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
