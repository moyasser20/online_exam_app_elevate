import 'package:json_annotation/json_annotation.dart';
import 'subject_model.dart';

part 'subjects_response_model.g.dart';

@JsonSerializable()
class SubjectsResponseModel {
  final String message;
  final List<SubjectModel> subjects;

  SubjectsResponseModel({required this.message, required this.subjects});

  factory SubjectsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsResponseModelToJson(this);
}
