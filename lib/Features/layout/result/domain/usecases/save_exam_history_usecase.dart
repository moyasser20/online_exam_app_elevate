import 'package:injectable/injectable.dart';
import '../entities/exam_history_entity.dart';
import '../repositories/exam_history_repository.dart';

@injectable
class SaveExamHistoryUseCase {
  final ExamHistoryRepository repo;
  SaveExamHistoryUseCase(this.repo);

  Future<void> call(ExamHistoryEntity history) => repo.saveHistory(history);
}
