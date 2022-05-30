import 'package:json_annotation/json_annotation.dart';

part 'update_order_status_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class UpdateOrderStatusRequest {
  @JsonKey(name: 'short_note')
  String? shortNote;

  UpdateOrderStatusRequest({this.shortNote});

  factory UpdateOrderStatusRequest.fromJson(Map<String, dynamic> json) => _$UpdateOrderStatusRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateOrderStatusRequestToJson(this);
}
