import 'package:online_exam_app_elevate/Features/exams/domain/entity/exams_entity.dart';

sealed class ExamBySubjectStates {}

class ExamsBySubjectInitialState extends ExamBySubjectStates {}

class ExamsBySubjectLoadingState extends ExamBySubjectStates {}

class ExamsBySubjectSuccessState extends ExamBySubjectStates {
  final List<ExamsEntity> exams;

  ExamsBySubjectSuccessState(this.exams);
}

class ExamsBySubjectErrorState extends ExamBySubjectStates {
  final String message;

  ExamsBySubjectErrorState(this.message);
}
