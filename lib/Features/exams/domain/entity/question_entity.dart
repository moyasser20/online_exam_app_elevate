import 'package:online_exam_app_elevate/Features/exams/domain/entity/answers_entity.dart';


class QuestionEntity {
  final String Id;
  final String question;
  final List<AnswersEntity> answers;
  final String type;
  final String correct;

  QuestionEntity({required this.Id, required this.question, required this.answers, required this.type, required this.correct});
}