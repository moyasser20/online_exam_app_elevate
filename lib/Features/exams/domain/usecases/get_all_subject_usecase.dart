
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/entity/subjects_entity.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/repositories/subject_repo.dart';

@injectable
class GetAllSubjectUseCases{
  final SubjectRepo _subjectRepo;

  GetAllSubjectUseCases(this._subjectRepo);

  Future<List<SubjectEntity>> call() async {
    return await _subjectRepo.getAllSubjects();
  }
}