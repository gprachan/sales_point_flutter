// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_bill_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBillRequest _$CreateBillRequestFromJson(Map<String, dynamic> json) =>
    CreateBillRequest(
      totalAmount: json['total_amount'] as int?,
      totalQuantity: json['total_quantity'] as int?,
      orderDate: json['order_date'] as String?,
      salesPointId: json['sales_point_id'] as int?,
      remarks: json['remarks'] as String?,
      salesPointBillItems: (json['sales_point_bill_items'] as List<dynamic>?)
          ?.map((e) => SalesPointBillItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateBillRequestToJson(CreateBillRequest instance) =>
    <String, dynamic>{
      'total_amount': instance.totalAmount,
      'total_quantity': instance.totalQuantity,
      'order_date': instance.orderDate,
      'sales_point_id': instance.salesPointId,
      'remarks': instance.remarks,
      'sales_point_bill_items': instance.salesPointBillItems,
    };

SalesPointBillItem _$SalesPointBillItemFromJson(Map<String, dynamic> json) =>
    SalesPointBillItem(
      itemId: json['item_id'] as int?,
      price: json['price'] as int?,
      billId: json['bill_id'] as int?,
      discountAmount: json['discount_amount'] as int?,
      quantity: json['quantity'] as int?,
      totalAmount: json['total_amount'] as int?,
      discountPercent: json['discount_percent'] as int?,
    );

Map<String, dynamic> _$SalesPointBillItemToJson(SalesPointBillItem instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'price': instance.price,
      'bill_id': instance.billId,
      'discount_amount': instance.discountAmount,
      'quantity': instance.quantity,
      'total_amount': instance.totalAmount,
      'discount_percent': instance.discountPercent,
    };
