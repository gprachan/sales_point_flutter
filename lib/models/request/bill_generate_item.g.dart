// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_generate_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillGenerateItem _$BillGenerateItemFromJson(Map<String, dynamic> json) =>
    BillGenerateItem(
      itemId: json['item_id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      discountAmount: json['discount_amount'] as int?,
      quantity: json['quantity'] as int?,
      totalAmount: json['total_amount'] as int?,
      discountPercent: (json['discount_percent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BillGenerateItemToJson(BillGenerateItem instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discount_amount': instance.discountAmount,
      'quantity': instance.quantity,
      'total_amount': instance.totalAmount,
      'discount_percent': instance.discountPercent,
    };
