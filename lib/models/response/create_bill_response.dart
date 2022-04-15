import 'package:json_annotation/json_annotation.dart';

part 'create_bill_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CreateBillResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'data')
  Data? data;

  CreateBillResponse({this.message, this.status, this.data});

  factory CreateBillResponse.fromJson(Map<String, dynamic> json) => _$CreateBillResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBillResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Data {
  @JsonKey(name: 'bill_id')
  String? billId;
  @JsonKey(name: 'total_amount')
  int? totalAmount;
  @JsonKey(name: 'total_quantity')
  int? totalQuantity;
  @JsonKey(name: 'order_date')
  String? orderDate;
  @JsonKey(name: 'delivery_type')
  String? deliveryType;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'school_id')
  int? schoolId;
  @JsonKey(name: 'grade_id')
  int? gradeId;
  @JsonKey(name: 'student_id')
  int? studentId;
  @JsonKey(name: 'sales_point_id')
  int? salesPointId;
  @JsonKey(name: 'student_address_id')
  dynamic studentAddressId;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'id')
  int? id;

  Data(
      {this.billId,
      this.totalAmount,
      this.totalQuantity,
      this.orderDate,
      this.deliveryType,
      this.fullName,
      this.schoolId,
      this.gradeId,
      this.studentId,
      this.salesPointId,
      this.studentAddressId,
      this.updatedAt,
      this.createdAt,
      this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
