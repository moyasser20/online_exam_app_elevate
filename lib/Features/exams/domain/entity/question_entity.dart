import '../../data/models/answers_model.dart';

class QuestionEntity {
  final String Id;
  final String question;
  final List<AnswersModel> answers;
  final String type;
  final String correct;

  QuestionEntity({required this.Id, required this.question, required this.answers, required this.type, required this.correct});
}