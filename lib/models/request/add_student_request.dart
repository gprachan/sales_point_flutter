import 'package:json_annotation/json_annotation.dart'; 

part 'add_student_request.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddStudentRequest {
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

  AddStudentRequest({this.firstName, this.lastName, this.email, this.phoneNo, this.address, this.schoolId, this.gradeId});

   factory AddStudentRequest.fromJson(Map<String, dynamic> json) => _$AddStudentRequestFromJson(json);

   Map<String, dynamic> toJson() => _$AddStudentRequestToJson(this);
}

