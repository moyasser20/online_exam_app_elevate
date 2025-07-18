import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class loginRequest {
  final String email;
  final String password;

  loginRequest({required this.email, required this.password});

  factory loginRequest.fromJson(Map<String, dynamic> json) =>
      _$loginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$loginRequestToJson(this);
}
