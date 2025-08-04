import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_model.g.dart';


@JsonSerializable()
class EditProfileRequestModel {
  final String? phone;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  EditProfileRequestModel({
      this.email,
      this.password,
    this.phone,
    this.username,
    this.firstName,
    this.lastName,
  });

  factory EditProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestModelToJson(this);
}
