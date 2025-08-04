import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? Id;

  @JsonKey(name: "username")
  final String? username;

  @JsonKey(name: "firstName")
  final String? firstName;

  @JsonKey(name: "lastName")
  final String? lastName;

  @JsonKey(name: "email")
  final String? email;

  @JsonKey(name: "phone")
  final String? phone;

  @JsonKey(name: "role")
  final String? role;

  @JsonKey(name: "password")
  final String? password;

  @JsonKey(name: "isVerified")
  final bool? isVerified;

  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  @JsonKey(name: "passwordChangedAt")
  final DateTime? passwordChangedAt;

  User({
    this.Id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
    this.passwordChangedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
