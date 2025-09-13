import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/entity/exams_entity.dart';
import '../repositories/exams_repo.dart';

@injectable
class GetExamDetailUseCase {
  final ExamsRepo _examsRepo;

  GetExamDetailUseCase(this._examsRepo);

  Future<ExamsEntity> call(String examId) async {
    return await _examsRepo.getExamDetail(examId);
  }
}
