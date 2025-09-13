import '../../domain/entities/exam_history_entity.dart';
import '../../domain/repositories/exam_history_repository.dart';
import '../datasources/exam_history_local_datasource.dart';
import '../models/exam_history_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ExamHistoryRepository)
class ExamHistoryRepositoryImpl implements ExamHistoryRepository {
  final ExamHistoryLocalDataSource local;

  ExamHistoryRepositoryImpl(this.local);

  @override
  Future<void> saveHistory(ExamHistoryEntity history) async {
    // Ensure history is a model for serialization
    final model =
        history is ExamHistoryModel
            ? history
            : ExamHistoryModel(
              examId: history.examId,
              answeredQuestionsCount: history.answeredQuestionsCount,
              correctAnswersCount: history.correctAnswersCount,
              timeTakenMinutes: history.timeTakenMinutes,
              submittedAt: history.submittedAt,
              examTitle: history.examTitle,
              examDurationMinutes: history.examDurationMinutes,
              examTotalQuestions: history.examTotalQuestions,
              selectedAnswers: history.selectedAnswers,
            );
    await local.save(model);
  }

  @override
  Future<List<ExamHistoryEntity>> getAllHistory() {
    return local.fetchAll();
  }

  @override
  Future<void> clearAll() {
    return local.clear();
  }
}
