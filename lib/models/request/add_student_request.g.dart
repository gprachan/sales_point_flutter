// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_student_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddStudentRequest _$AddStudentRequestFromJson(Map<String, dynamic> json) =>
    AddStudentRequest(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phone_no'] as String?,
      address: json['address'] as String?,
      schoolId: json['school_id'] as int?,
      gradeId: json['grade_id'] as int?,
    );

Map<String, dynamic> _$AddStudentRequestToJson(AddStudentRequest instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_no': instance.phoneNo,
      'address': instance.address,
      'school_id': instance.schoolId,
      'grade_id': instance.gradeId,
    };
