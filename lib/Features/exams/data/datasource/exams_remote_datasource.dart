import '../models/exam_model.dart';
import '../models/question_model.dart';

abstract class ExamsRemoteDataSource {

  Future<List<ExamModel>> getExamsBySubject(String subjectId);

  Future<ExamModel> getExamDetail(String examId);

  Future<List<QuestionModel>> getExamQuestions(String examId);
}