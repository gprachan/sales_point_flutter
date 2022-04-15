import 'package:json_annotation/json_annotation.dart';

part 'create_bill_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CreateBillRequest {
  @JsonKey(name: 'total_amount')
  int? totalAmount;
  @JsonKey(name: 'total_quantity')
  int? totalQuantity;
  @JsonKey(name: 'order_date')
  String? orderDate;
  @JsonKey(name: 'sales_point_id')
  int? salesPointId;
  @JsonKey(name: 'remarks')
  String? remarks;
  @JsonKey(name: 'sales_point_bill_items')
  List<SalesPointBillItem>? salesPointBillItems;

  CreateBillRequest(
      {this.totalAmount,
      this.totalQuantity,
      this.orderDate,
      this.salesPointId,
      this.remarks,
      this.salesPointBillItems});

  factory CreateBillRequest.fromJson(Map<String, dynamic> json) => _$CreateBillRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBillRequestToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class SalesPointBillItem {
  @JsonKey(name: 'item_id')
  int? itemId;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'bill_id')
  int? billId;
  @JsonKey(name: 'discount_amount')
  int? discountAmount;
  @JsonKey(name: 'quantity')
  int? quantity;
  @JsonKey(name: 'total_amount')
  int? totalAmount;
  @JsonKey(name: 'discount_percent')
  int? discountPercent;

  SalesPointBillItem(
      {this.itemId,
      this.price,
      this.billId,
      this.discountAmount,
      this.quantity,
      this.totalAmount,
      this.discountPercent});

  factory SalesPointBillItem.fromJson(Map<String, dynamic> json) => _$SalesPointBillItemFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPointBillItemToJson(this);
}
