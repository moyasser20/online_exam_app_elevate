import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/entity/exams_entity.dart';
import '../repositories/exams_repo.dart';

@injectable
class GetExamBySubjectUseCase {
  final ExamsRepo _examsRepo;

  GetExamBySubjectUseCase(this._examsRepo);

  Future<List<ExamsEntity>> call(String subjectId) async {
    return await _examsRepo.getExamsBySubject(subjectId);
  }
}
