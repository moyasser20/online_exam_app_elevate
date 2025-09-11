import 'package:json_annotation/json_annotation.dart';
import 'user_data.dart';

part 'edit_profile_response_model.g.dart';

@JsonSerializable()
class EditProfileResponseModel {
  final String message;
  final User user;

  EditProfileResponseModel({required this.message, required this.user});

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseModelToJson(this);
}
