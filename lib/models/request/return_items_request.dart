import 'package:json_annotation/json_annotation.dart';

part 'return_items_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ReturnItemsRequest {
  @JsonKey(name: 'return_date')
  String? returnDate;
  @JsonKey(name: 'return_items_details')
  List<ReturnItemsDetail>? returnItemsDetails;

  ReturnItemsRequest({this.returnDate, this.returnItemsDetails});

  factory ReturnItemsRequest.fromJson(Map<String, dynamic> json) => _$ReturnItemsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnItemsRequestToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ReturnItemsDetail {
  @JsonKey(name: 'item_id')
  int? itemId;
  @JsonKey(name: 'quantity')
  int? quantity;

  ReturnItemsDetail({this.itemId, this.quantity});

  factory ReturnItemsDetail.fromJson(Map<String, dynamic> json) => _$ReturnItemsDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnItemsDetailToJson(this);
}
