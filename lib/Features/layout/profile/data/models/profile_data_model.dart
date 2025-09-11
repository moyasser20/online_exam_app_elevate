import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/user_data.dart';

part 'profile_data_model.g.dart';

@JsonSerializable()
class ProfileDataModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;

  ProfileDataModel({this.message, this.user});

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileDataModelToJson(this);
  }
}
