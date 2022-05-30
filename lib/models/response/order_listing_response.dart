import 'package:json_annotation/json_annotation.dart';

part 'order_listing_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class OrderListingResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'bill_id')
  String? billId;
  @JsonKey(name: 'order_date')
  String? orderDate;
  @JsonKey(name: 'total_amount')
  double? totalAmount;
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
  int? studentAddressId;
  @JsonKey(name: 'status_id')
  int? statusId;
  @JsonKey(name: 'delivery_charge')
  double? deliveryCharge;
  @JsonKey(name: 'delivery_person_id')
  int? deliveryPersonId;

  OrderListingResponse(
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
      this.statusId,
      this.deliveryCharge,
      this.deliveryPersonId});

  factory OrderListingResponse.fromJson(Map<String, dynamic> json) => _$OrderListingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListingResponseToJson(this);
}
