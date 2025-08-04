// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestModel _$EditProfileRequestModelFromJson(
  Map<String, dynamic> json,
) => EditProfileRequestModel(
  email: json['email'] as String?,
  password: json['password'] as String?,
  phone: json['phone'] as String?,
  username: json['username'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
);

Map<String, dynamic> _$EditProfileRequestModelToJson(
  EditProfileRequestModel instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'username': instance.username,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'password': instance.password,
};
