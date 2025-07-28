import 'package:online_exam_app_elevate/Features/exams/domain/entity/subjects_entity.dart';

abstract class SubjectRepo {

  Future<List<SubjectEntity>> getAllSubjects();
}