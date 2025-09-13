import 'package:injectable/injectable.dart';

import '../entity/subjects_entity.dart';
import '../repositories/subject_repo.dart';

@injectable
class GetAllSubjectUseCases {
  final SubjectRepo _subjectRepo;

  GetAllSubjectUseCases(this._subjectRepo);

  Future<List<SubjectEntity>> call() async {
    return await _subjectRepo.getAllSubjects();
  }
}
