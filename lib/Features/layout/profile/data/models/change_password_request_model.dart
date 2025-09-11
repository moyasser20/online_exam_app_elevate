import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_model.g.dart';

@JsonSerializable()
class ChangePasswordRequestModel {
  @JsonKey(name: "oldPassword")
  final String? oldPassword;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;

  ChangePasswordRequestModel ({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePasswordRequestModelToJson(this);
  }
}


