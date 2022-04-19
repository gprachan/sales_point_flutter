import 'package:json_annotation/json_annotation.dart'; 

part 'bill_generate_item.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class BillGenerateItem {
  @JsonKey(name: 'item_id')
  int? itemId;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'discount_amount')
  int? discountAmount;
  @JsonKey(name: 'quantity')
  int? quantity;
  @JsonKey(name: 'total_amount')
  double? totalAmount;
  @JsonKey(name: 'discount_percent')
  double? discountPercent;

  BillGenerateItem({this.itemId, this.name, this.description, this.price, this.discountAmount, this.quantity, this.totalAmount, this.discountPercent});

   factory BillGenerateItem.fromJson(Map<String, dynamic> json) => _$BillGenerateItemFromJson(json);

   Map<String, dynamic> toJson() => _$BillGenerateItemToJson(this);
}

