import 'package:json_annotation/json_annotation.dart'; 

part 'common_response.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CommonResponse {
  @JsonKey(name: 'message')
  String? message;

  CommonResponse({this.message});

   factory CommonResponse.fromJson(Map<String, dynamic> json) => _$CommonResponseFromJson(json);

   Map<String, dynamic> toJson() => _$CommonResponseToJson(this);
}

