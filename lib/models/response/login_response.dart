import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class LoginResponse {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'user')
  User? user;
  @JsonKey(name: 'token_type')
  String? tokenType;
  @JsonKey(name: 'expires_in')
  int? expiresIn;

  LoginResponse({this.accessToken, this.user, this.tokenType, this.expiresIn});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class User {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'type')
  int? type;
  @JsonKey(name: 'active')
  int? active;
  @JsonKey(name: 'email_verified_at')
  dynamic emailVerifiedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'reset_token')
  dynamic resetToken;
  @JsonKey(name: 'sales_point_user')
  SalesPointUser? salesPointUser;

  User(
      {this.id,
      this.name,
      this.email,
      this.type,
      this.active,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.resetToken,
      this.salesPointUser});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class SalesPointUser {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'mobile')
  String? mobile;
  @JsonKey(name: 'ip_address')
  String? ipAddress;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'sales_point_id')
  int? salesPointId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'sales_point')
  SalesPoint? salesPoint;

  SalesPointUser(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.ipAddress,
      this.userId,
      this.salesPointId,
      this.createdAt,
      this.updatedAt,
      this.salesPoint});

  factory SalesPointUser.fromJson(Map<String, dynamic> json) => _$SalesPointUserFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPointUserToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class SalesPoint {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'slug')
  String? slug;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  SalesPoint({this.id, this.name, this.slug, this.location, this.phoneNumber, this.createdAt, this.updatedAt});

  factory SalesPoint.fromJson(Map<String, dynamic> json) => _$SalesPointFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPointToJson(this);
}
