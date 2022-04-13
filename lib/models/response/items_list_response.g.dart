// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsListResponse _$ItemsListResponseFromJson(Map<String, dynamic> json) =>
    ItemsListResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ItemListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsListResponseToJson(ItemsListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

ItemListData _$ItemListDataFromJson(Map<String, dynamic> json) => ItemListData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      quantity: json['quantity'] as String?,
      type: json['type'] as String?,
      sale: json['sale'] as String?,
      featuredImage: json['featured_image'] as String?,
    );

Map<String, dynamic> _$ItemListDataToJson(ItemListData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'type': instance.type,
      'sale': instance.sale,
      'featured_image': instance.featuredImage,
    };
