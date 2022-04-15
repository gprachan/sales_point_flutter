import 'package:json_annotation/json_annotation.dart'; 

part 'create_address_request.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CreateAddressRequest {
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'address_detail')
  String? addressDetail;
  @JsonKey(name: 'student_id')
  int? studentId;

  CreateAddressRequest({this.fullName, this.email, this.phoneNumber, this.address, this.addressDetail, this.studentId});

   factory CreateAddressRequest.fromJson(Map<String, dynamic> json) => _$CreateAddressRequestFromJson(json);

   Map<String, dynamic> toJson() => _$CreateAddressRequestToJson(this);
}

