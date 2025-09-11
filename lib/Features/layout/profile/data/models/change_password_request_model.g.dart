// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequestModel _$ChangePasswordRequestModelFromJson(
  Map<String, dynamic> json,
) => ChangePasswordRequestModel(
  oldPassword: json['oldPassword'] as String?,
  password: json['password'] as String?,
  rePassword: json['rePassword'] as String?,
);

Map<String, dynamic> _$ChangePasswordRequestModelToJson(
  ChangePasswordRequestModel instance,
) => <String, dynamic>{
  'oldPassword': instance.oldPassword,
  'password': instance.password,
  'rePassword': instance.rePassword,
};
