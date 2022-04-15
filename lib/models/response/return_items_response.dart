import 'package:json_annotation/json_annotation.dart'; 

part 'return_items_response.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ReturnItemsResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'data')
  Data? data;

  ReturnItemsResponse({this.message, this.status, this.data});

   factory ReturnItemsResponse.fromJson(Map<String, dynamic> json) => _$ReturnItemsResponseFromJson(json);

   Map<String, dynamic> toJson() => _$ReturnItemsResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Data {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'slug')
  String? slug;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Data({this.id, this.name, this.slug, this.location, this.phoneNumber, this.createdAt, this.updatedAt});

   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

   Map<String, dynamic> toJson() => _$DataToJson(this);
}

