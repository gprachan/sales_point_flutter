import 'package:json_annotation/json_annotation.dart';

part 'bill_listing_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class BillListingResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'data')
  List<BillData>? data;

  BillListingResponse({this.message, this.status, this.data});

  factory BillListingResponse.fromJson(Map<String, dynamic> json) => _$BillListingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BillListingResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class BillData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'bill_id')
  String? billId;
  @JsonKey(name: 'order_date')
  String? orderDate;
  @JsonKey(name: 'total_amount')
  int? totalAmount;
  @JsonKey(name: 'student_id')
  int? studentId;
  @JsonKey(name: 'school_id')
  int? schoolId;
  @JsonKey(name: 'grade_id')
  int? gradeId;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'delivery_type')
  String? deliveryType;
  @JsonKey(name: 'total_quantity')
  int? totalQuantity;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'sales_point_id')
  int? salesPointId;
  @JsonKey(name: 'student_address_id')
  dynamic studentAddressId;
  @JsonKey(name: 'school')
  School? school;
  @JsonKey(name: 'student')
  Student? student;

  BillData(
      {this.id,
      this.billId,
      this.orderDate,
      this.totalAmount,
      this.studentId,
      this.schoolId,
      this.gradeId,
      this.fullName,
      this.deliveryType,
      this.totalQuantity,
      this.createdAt,
      this.updatedAt,
      this.salesPointId,
      this.studentAddressId,
      this.school,
      this.student});

  factory BillData.fromJson(Map<String, dynamic> json) => _$BillDataFromJson(json);

  Map<String, dynamic> toJson() => _$BillDataToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class School {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'contact_no')
  String? contactNo;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'grade_id')
  dynamic gradeId;

  School(
      {this.id,
      this.name,
      this.address,
      this.contactNo,
      this.image,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.gradeId});

  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Student {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'school_id')
  int? schoolId;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone_no')
  String? phoneNo;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'grade_id')
  int? gradeId;

  Student(
      {this.id,
      this.schoolId,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNo,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.gradeId});

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
