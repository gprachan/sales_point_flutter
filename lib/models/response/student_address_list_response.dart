import 'package:json_annotation/json_annotation.dart';

part 'student_address_list_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class StudentAddressListResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'data')
  List<AddressData>? data;

  StudentAddressListResponse({this.message, this.status, this.data});

  factory StudentAddressListResponse.fromJson(Map<String, dynamic> json) => _$StudentAddressListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentAddressListResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class AddressData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'student_id')
  int? studentId;
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
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  AddressData(
      {this.id,
      this.studentId,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.address,
      this.addressDetail,
      this.createdAt,
      this.updatedAt});

  factory AddressData.fromJson(Map<String, dynamic> json) => _$AddressDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}
