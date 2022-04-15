// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_listing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolListingResponse _$SchoolListingResponseFromJson(
        Map<String, dynamic> json) =>
    SchoolListingResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      contactNo: json['contact_no'] as String?,
      image: json['image'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      gradeId: json['grade_id'],
      grades: (json['grades'] as List<dynamic>?)
          ?.map((e) => Grade.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchoolListingResponseToJson(
        SchoolListingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'contact_no': instance.contactNo,
      'image': instance.image,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'grade_id': instance.gradeId,
      'grades': instance.grades,
    };

Grade _$GradeFromJson(Map<String, dynamic> json) => Grade(
      id: json['id'] as int?,
      gradeName: json['grade_name'] as String?,
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GradeToJson(Grade instance) => <String, dynamic>{
      'id': instance.id,
      'grade_name': instance.gradeName,
      'pivot': instance.pivot,
    };

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      schoolId: json['school_id'] as int?,
      gradeId: json['grade_id'] as int?,
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'school_id': instance.schoolId,
      'grade_id': instance.gradeId,
    };
