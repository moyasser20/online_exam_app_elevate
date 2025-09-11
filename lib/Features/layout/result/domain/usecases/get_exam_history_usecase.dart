import 'package:injectable/injectable.dart';
import '../entities/exam_history_entity.dart';
import '../repositories/exam_history_repository.dart';

@injectable
class GetExamHistoryUseCase {
  final ExamHistoryRepository repo;
  GetExamHistoryUseCase(this.repo);

  Future<List<ExamHistoryEntity>> call() => repo.getAllHistory();
}


