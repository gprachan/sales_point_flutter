import 'package:json_annotation/json_annotation.dart';

part 'order_status_response.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class OrderStatusResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'active')
  int? active;
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  OrderStatusResponse({this.id, this.name, this.description, this.active, this.status, this.createdAt, this.updatedAt});

  factory OrderStatusResponse.fromJson(Map<String, dynamic> json) => _$OrderStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStatusResponseToJson(this);
}
