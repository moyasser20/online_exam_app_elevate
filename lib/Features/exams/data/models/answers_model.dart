import 'package:json_annotation/json_annotation.dart';

part 'answers_model.g.dart';

@JsonSerializable()
class AnswersModel {
  @JsonKey(name: "answer")
  final String answer;
  @JsonKey(name: "key")
  final String key;

  AnswersModel ({
    required this.answer,
    required this.key,
  });

  factory AnswersModel.fromJson(Map<String, dynamic> json) {
    return _$AnswersModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersModelToJson(this);
  }
}