
import '../entity/subjects_entity.dart';

abstract class SubjectRepo {

  Future<List<SubjectEntity>> getAllSubjects();
}