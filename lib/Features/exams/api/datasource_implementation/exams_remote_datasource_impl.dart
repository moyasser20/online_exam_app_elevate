import 'package:injectable/injectable.dart';
import '../../data/datasource/exams_remote_datasource.dart';
import '../../data/models/exam_model.dart';
import '../../data/models/question_model.dart';
import '../client/exams_api_client.dart';

@LazySingleton(as: ExamsRemoteDataSource)
class ExamsRemoteDataSourceImpl implements ExamsRemoteDataSource {
  final ExamsApiClient api;

  ExamsRemoteDataSourceImpl(this.api);

  @override
  Future<List<ExamModel>> getExamsBySubject(String subjectId) async {
    final res = await api.getExamsBySubject(subjectId);
    return res.exams;
  }

  @override
  Future<ExamModel> getExamDetail(String examId) async {
    final res = await api.getExamDetail(examId);
    return res.exam;
  }

  @override
  Future<List<QuestionModel>> getExamQuestions(String examId) async {
    final res = await api.getQuestions(examId);
    return res.questions;
  }
}
