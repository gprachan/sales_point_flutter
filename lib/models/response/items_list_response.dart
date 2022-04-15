import 'package:json_annotation/json_annotation.dart';

part 'items_list_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ItemsListResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'data')
  List<ItemListData>? data;

  ItemsListResponse({this.message, this.status, this.data});

  factory ItemsListResponse.fromJson(Map<String, dynamic> json) => _$ItemsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsListResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ItemListData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'quantity')
  String? quantity;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'sale')
  String? sale;
  @JsonKey(name: 'featured_image')
  String? featuredImage;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'discount_amount')
  int? discountAmount;

  ItemListData({
    this.id,
    this.name,
    this.quantity,
    this.type,
    this.sale,
    this.featuredImage,
    this.price,
  });

  factory ItemListData.fromJson(Map<String, dynamic> json) => _$ItemListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemListDataToJson(this);
}
