import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/entity/question_entity.dart';
import '../repositories/exams_repo.dart';

@injectable
class GetExamQuestionsUseCase {
  final ExamsRepo _examsRepo;

  GetExamQuestionsUseCase(this._examsRepo);

  Future<List<QuestionEntity>> call(String examId) async {
    return await _examsRepo.getExamQuestions(examId);
  }
}