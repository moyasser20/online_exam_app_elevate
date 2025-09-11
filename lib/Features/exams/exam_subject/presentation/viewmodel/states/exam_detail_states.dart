import 'package:online_exam_app_elevate/Features/exams/domain/entity/exams_entity.dart';

sealed class ExamDetailStates {}

class ExamsDetailInitialState extends ExamDetailStates {}

class ExamsDetailLoadingState extends ExamDetailStates {}

class ExamsDetailSuccessState extends ExamDetailStates {
  final ExamsEntity examDetail;

  ExamsDetailSuccessState(this.examDetail);
}

class ExamsDetailErrorState extends ExamDetailStates {
  final String message;

  ExamsDetailErrorState(this.message);
}
