// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_listing_by_school_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemListingBySchoolResponse _$ItemListingBySchoolResponseFromJson(
        Map<String, dynamic> json) =>
    ItemListingBySchoolResponse(
      id: json['id'] as int?,
      isbn: json['isbn'] as String?,
      itemName: json['item_name'] as String?,
      itemDescription: json['item_description'] as String?,
      itemStatusId: json['item_status_id'] as int?,
      regularPrice: (json['regular_price'] as num?)?.toDouble(),
      discountPrice: json['discount_price'] as int?,
      createdBy: (json['created_by'] as num?)?.toDouble(),
      updatedBy: (json['updated_by'] as num?)?.toDouble(),
      itemType: (json['item_type'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      depth: (json['depth'] as num?)?.toDouble(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      vendorId: (json['vendor_id'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      publishedDate: json['published_date'] as String?,
      discount: (json['discount'] as num?)?.toDouble(),
      commission: (json['commission'] as num?)?.toDouble(),
      type: json['type'] as String?,
      sale: json['sale'] as String?,
      featuredImage: json['featured_image'] as String?,
    );

Map<String, dynamic> _$ItemListingBySchoolResponseToJson(
        ItemListingBySchoolResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isbn': instance.isbn,
      'item_name': instance.itemName,
      'item_description': instance.itemDescription,
      'item_status_id': instance.itemStatusId,
      'regular_price': instance.regularPrice,
      'discount_price': instance.discountPrice,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'item_type': instance.itemType,
      'quantity': instance.quantity,
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'vendor_id': instance.vendorId,
      'unit': instance.unit,
      'rating': instance.rating,
      'published_date': instance.publishedDate,
      'discount': instance.discount,
      'commission': instance.commission,
      'type': instance.type,
      'sale': instance.sale,
      'featured_image': instance.featuredImage,
    };
