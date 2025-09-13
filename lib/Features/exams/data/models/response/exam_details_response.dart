import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app_elevate/Features/exams/data/models/exam_model.dart';

part 'exam_details_response.g.dart';

@JsonSerializable()
class ExamDetailsResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "exam")
  final ExamModel exam;

  ExamDetailsResponse({required this.message, required this.exam});

  factory ExamDetailsResponse.fromJson(Map<String, dynamic> json) {
    return _$ExamDetailsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamDetailsResponseToJson(this);
  }
}
