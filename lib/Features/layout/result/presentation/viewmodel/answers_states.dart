import '../../../../exams/domain/entity/question_entity.dart';

abstract class AnswersState {}

class AnswersInitial extends AnswersState {}

class AnswersLoading extends AnswersState {}

class AnswersLoaded extends AnswersState {
  final List<QuestionEntity> questions;
  final List<String?> selectedAnswers;
  AnswersLoaded({required this.questions, required this.selectedAnswers});
}

class AnswersError extends AnswersState {
  final String message;
  AnswersError(this.message);
}
