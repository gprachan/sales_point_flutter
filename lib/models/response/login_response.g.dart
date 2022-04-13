// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['access_token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      tokenType: json['token_type'] as String?,
      expiresIn: json['expires_in'] as int?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'user': instance.user,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      type: json['type'] as int?,
      active: json['active'] as int?,
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      resetToken: json['reset_token'],
      salesPointUser: json['sales_point_user'] == null
          ? null
          : SalesPointUser.fromJson(
              json['sales_point_user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'type': instance.type,
      'active': instance.active,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'reset_token': instance.resetToken,
      'sales_point_user': instance.salesPointUser,
    };

SalesPointUser _$SalesPointUserFromJson(Map<String, dynamic> json) =>
    SalesPointUser(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      ipAddress: json['ip_address'] as String?,
      userId: json['user_id'] as int?,
      salesPointId: json['sales_point_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      salesPoint: json['sales_point'] == null
          ? null
          : SalesPoint.fromJson(json['sales_point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalesPointUserToJson(SalesPointUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
      'ip_address': instance.ipAddress,
      'user_id': instance.userId,
      'sales_point_id': instance.salesPointId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'sales_point': instance.salesPoint,
    };

SalesPoint _$SalesPointFromJson(Map<String, dynamic> json) => SalesPoint(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      location: json['location'] as String?,
      phoneNumber: json['phone_number'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SalesPointToJson(SalesPoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'location': instance.location,
      'phone_number': instance.phoneNumber,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
