import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/data/datasource/exams_remote_datasource.dart';
import 'package:online_exam_app_elevate/Features/exams/data/models/exam_model.dart';
import 'package:online_exam_app_elevate/Features/exams/data/models/question_model.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/entity/exams_entity.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/entity/question_entity.dart';
import '../../domain/repositories/exams_repo.dart';


@LazySingleton(as: ExamsRepo)
class ExamsRepoImpl implements ExamsRepo {
  final ExamsRemoteDataSource _remoteDataSource;

  ExamsRepoImpl(this._remoteDataSource);

  @override
  Future<List<ExamsEntity>> getExamsBySubject(String subjectId) async {
    final List<ExamModel> models = await _remoteDataSource.getExamsBySubject(
      subjectId,
    );

    return models
        .map(
          (models) => ExamsEntity(
            Id: models.Id,
            title: models.title,
            duration: models.duration,
            numberOfQuestions: models.numberOfQuestions,
          ),
        )
        .toList();
  }

  @override
  Future<ExamsEntity> getExamDetail(String examId) async {
    final ExamModel model = await _remoteDataSource.getExamDetail(examId);
    return ExamsEntity(
      Id: model.Id,
      title: model.title,
      duration: model.duration,
      numberOfQuestions: model.numberOfQuestions,
    );
  }

  @override
  Future<List<QuestionEntity>> getExamQuestions(String examId) async {
    final List<QuestionModel> models = await _remoteDataSource.getExamQuestions(
      examId,
    );
    return models
        .map(
          (models) => QuestionEntity(
            Id: models.Id,
            question: models.question,
            answers: models.answers,
            type: models.type,
            correct: models.correct,
          ),
        )
        .toList();
  }
}
