import 'package:json_annotation/json_annotation.dart';
import 'package:salespoint_flutter/models/request/bill_generate_item.dart';

part 'create_bill_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CreateBillRequest {
  @JsonKey(name: 'total_amount')
  double? totalAmount;
  @JsonKey(name: 'regular_price')
  double? regularPrice;
  @JsonKey(name: 'total_quantity')
  int? totalQuantity;
  @JsonKey(name: 'order_date')
  String? orderDate;
  @JsonKey(name: 'delivery_type')
  String? deliveryType;
  @JsonKey(name: 'school_id')
  int? schoolId;
  @JsonKey(name: 'grade_id')
  int? gradeId;
  @JsonKey(name: 'student_id')
  int? studentId;
  @JsonKey(name: '2')
  int? two;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'sales_point_id')
  int? salesPointId;
  @JsonKey(name: 'student_address_id')
  int? studentAddressId;
  @JsonKey(name: 'bill_items')
  List<BillGenerateItem>? billItems;

  CreateBillRequest({
    this.totalAmount,
    this.regularPrice,
    this.totalQuantity,
    this.orderDate,
    this.deliveryType,
    this.schoolId,
    this.gradeId,
    this.studentId,
    this.two,
    this.fullName,
    this.salesPointId,
    this.studentAddressId,
    this.billItems,
  });

  factory CreateBillRequest.fromJson(Map<String, dynamic> json) => _$CreateBillRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBillRequestToJson(this);
}
