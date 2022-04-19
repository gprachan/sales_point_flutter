import 'package:json_annotation/json_annotation.dart';

part 'item_listing_by_school_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ItemListingBySchoolResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'isbn')
  String? isbn;
  @JsonKey(name: 'item_name')
  String? itemName;
  @JsonKey(name: 'item_description')
  String? itemDescription;
  @JsonKey(name: 'item_status_id')
  int? itemStatusId;
  @JsonKey(name: 'regular_price')
  double? regularPrice;
  @JsonKey(name: 'discount_price')
  int? discountPrice;
  @JsonKey(name: 'created_by')
  double? createdBy;
  @JsonKey(name: 'updated_by')
  double? updatedBy;
  @JsonKey(name: 'item_type')
  double? itemType;
  @JsonKey(name: 'quantity')
  double? quantity;
  @JsonKey(name: 'width')
  double? width;
  @JsonKey(name: 'height')
  double? height;
  @JsonKey(name: 'depth')
  double? depth;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'vendor_id')
  double? vendorId;
  @JsonKey(name: 'unit')
  String? unit;
  @JsonKey(name: 'rating')
  double? rating;
  @JsonKey(name: 'published_date')
  String? publishedDate;
  @JsonKey(name: 'discount')
  double? discount;
  @JsonKey(name: 'commission')
  double? commission;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'sale')
  String? sale;
  @JsonKey(name: 'featured_image')
  String? featuredImage;

  ItemListingBySchoolResponse(
      {this.id,
      this.isbn,
      this.itemName,
      this.itemDescription,
      this.itemStatusId,
      this.regularPrice,
      this.discountPrice,
      this.createdBy,
      this.updatedBy,
      this.itemType,
      this.quantity,
      this.width,
      this.height,
      this.depth,
      this.createdAt,
      this.updatedAt,
      this.vendorId,
      this.unit,
      this.rating,
      this.publishedDate,
      this.discount,
      this.commission,
      this.type,
      this.sale,
      this.featuredImage});

  factory ItemListingBySchoolResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemListingBySchoolResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemListingBySchoolResponseToJson(this);
}
