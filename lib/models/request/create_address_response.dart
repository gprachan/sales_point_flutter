import 'package:json_annotation/json_annotation.dart'; 

part 'create_address_response.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CreateAddressResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'data')
  Data? data;

  CreateAddressResponse({this.message, this.status, this.data});

   factory CreateAddressResponse.fromJson(Map<String, dynamic> json) => _$CreateAddressResponseFromJson(json);

   Map<String, dynamic> toJson() => _$CreateAddressResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Data {
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
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'id')
  int? id;

  Data({this.fullName, this.email, this.phoneNumber, this.address, this.addressDetail, this.studentId, this.updatedAt, this.createdAt, this.id});

   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

   Map<String, dynamic> toJson() => _$DataToJson(this);
}

