import 'package:json_annotation/json_annotation.dart';

part 'school_listing_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class SchoolListingResponse {
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
  @JsonKey(name: 'grades')
  List<Grade>? grades = [];

  SchoolListingResponse(
      {this.id,
      this.name,
      this.address,
      this.contactNo,
      this.image,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.gradeId,
      this.grades});

  factory SchoolListingResponse.fromJson(Map<String, dynamic> json) => _$SchoolListingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolListingResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Grade {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'grade_name')
  String? gradeName;
  @JsonKey(name: 'pivot')
  Pivot? pivot;

  Grade({this.id, this.gradeName, this.pivot});

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);

  Map<String, dynamic> toJson() => _$GradeToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Pivot {
  @JsonKey(name: 'school_id')
  int? schoolId;
  @JsonKey(name: 'grade_id')
  int? gradeId;

  Pivot({this.schoolId, this.gradeId});

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);
}
