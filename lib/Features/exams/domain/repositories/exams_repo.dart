import 'package:online_exam_app_elevate/Features/exams/domain/entity/exams_entity.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/entity/question_entity.dart';

abstract class ExamsRepo {
  Future<List<ExamsEntity>> getExamsBySubject(String subjectId);
  Future<ExamsEntity> getExamDetail(String examId);
  Future<List<QuestionEntity>> getExamQuestions(String examId);
}
