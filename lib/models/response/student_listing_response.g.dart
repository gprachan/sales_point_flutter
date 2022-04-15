// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_listing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentListingResponse _$StudentListingResponseFromJson(
        Map<String, dynamic> json) =>
    StudentListingResponse(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StudentData.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      lastPageUrl: json['last_page_url'] as String?,
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$StudentListingResponseToJson(
        StudentListingResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

StudentData _$StudentDataFromJson(Map<String, dynamic> json) => StudentData(
      id: json['id'] as int?,
      schoolId: json['school_id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phone_no'] as String?,
      address: json['address'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      gradeId: json['grade_id'] as int?,
    );

Map<String, dynamic> _$StudentDataToJson(StudentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_id': instance.schoolId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_no': instance.phoneNo,
      'address': instance.address,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'grade_id': instance.gradeId,
    };
