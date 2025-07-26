import 'package:json_annotation/json_annotation.dart';
import '/Features/login/data/models/user_model.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserModel? user;

  SignupResponse ({
    this.message,
    this.token,
    this.user,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return _$SignupResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignupResponseToJson(this);
  }
}

