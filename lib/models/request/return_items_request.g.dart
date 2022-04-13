// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_items_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnItemsRequest _$ReturnItemsRequestFromJson(Map<String, dynamic> json) =>
    ReturnItemsRequest(
      returnDate: json['return_date'] as String?,
      returnItemsDetails: (json['return_items_details'] as List<dynamic>?)
          ?.map((e) => ReturnItemsDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReturnItemsRequestToJson(ReturnItemsRequest instance) =>
    <String, dynamic>{
      'return_date': instance.returnDate,
      'return_items_details': instance.returnItemsDetails,
    };

ReturnItemsDetail _$ReturnItemsDetailFromJson(Map<String, dynamic> json) =>
    ReturnItemsDetail(
      itemId: json['item_id'] as int?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$ReturnItemsDetailToJson(ReturnItemsDetail instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'quantity': instance.quantity,
    };
