import 'package:json_annotation/json_annotation.dart'; 

part 'add_student_response.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddStudentResponse {
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
  @JsonKey(name: 'school_id')
  int? schoolId;
  @JsonKey(name: 'grade_id')
  int? gradeId;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'id')
  int? id;

  AddStudentResponse({this.firstName, this.lastName, this.email, this.phoneNo, this.address, this.schoolId, this.gradeId, this.updatedAt, this.createdAt, this.id});

   factory AddStudentResponse.fromJson(Map<String, dynamic> json) => _$AddStudentResponseFromJson(json);

   Map<String, dynamic> toJson() => _$AddStudentResponseToJson(this);
}

