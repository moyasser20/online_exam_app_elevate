import 'package:injectable/injectable.dart';
import '../repositories/exam_history_repository.dart';

@injectable
class ClearExamHistoryUseCase {
  final ExamHistoryRepository repo;
  ClearExamHistoryUseCase(this.repo);

  Future<void> call() => repo.clearAll();
}
