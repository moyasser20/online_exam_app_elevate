import 'package:json_annotation/json_annotation.dart';

import '../question_model.dart';

part 'question_response.g.dart';

@JsonSerializable()
class QuestionResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "questions")
  final List<QuestionModel> questions;

  QuestionResponse({required this.message, required this.questions});

  factory QuestionResponse.fromJson(Map<String, dynamic> json) {
    return _$QuestionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionResponseToJson(this);
  }
}
