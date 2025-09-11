import 'package:json_annotation/json_annotation.dart';
import '../../../layout/explore/data/models/subject_model.dart';
import 'answers_model.dart';
import 'exam_model.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: "_id")
  final String Id;
  @JsonKey(name: "question")
  final String question;
  @JsonKey(name: "answers")
  final List<AnswersModel> answers;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "correct")
  final String correct;
  @JsonKey(name: "subject")
  final SubjectModel subject;
  @JsonKey(name: "exam")
  final ExamModel exam;
  @JsonKey(name: "createdAt")
  final String createdAt;

  QuestionModel ({
    required this.Id,
    required this.question,
    required this.answers,
    required this.type,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return _$QuestionModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionModelToJson(this);
  }
}