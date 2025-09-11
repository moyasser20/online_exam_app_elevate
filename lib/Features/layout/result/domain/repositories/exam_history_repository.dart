import '../entities/exam_history_entity.dart';

abstract class ExamHistoryRepository {
  Future<void> saveHistory(ExamHistoryEntity history);
  Future<List<ExamHistoryEntity>> getAllHistory();
  Future<void> clearAll();
}


