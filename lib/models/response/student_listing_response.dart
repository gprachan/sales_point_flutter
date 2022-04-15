import 'package:json_annotation/json_annotation.dart';

part 'student_listing_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class StudentListingResponse {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'data')
  List<StudentData>? data;
  @JsonKey(name: 'first_page_url')
  String? firstPageUrl;
  @JsonKey(name: 'from')
  int? from;
  @JsonKey(name: 'last_page')
  int? lastPage;
  @JsonKey(name: 'last_page_url')
  String? lastPageUrl;
  @JsonKey(name: 'next_page_url')
  String? nextPageUrl;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'prev_page_url')
  String? prevPageUrl;
  @JsonKey(name: 'to')
  int? to;
  @JsonKey(name: 'total')
  int? total;

  StudentListingResponse(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  factory StudentListingResponse.fromJson(Map<String, dynamic> json) => _$StudentListingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentListingResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class StudentData {
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

  StudentData(
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

  factory StudentData.fromJson(Map<String, dynamic> json) => _$StudentDataFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDataToJson(this);
}
