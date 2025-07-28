import 'package:online_exam_app_elevate/Features/exams/data/models/subject_model.dart';

abstract class SubjectRemoteDataSource {

  Future<List<SubjectModel>> getAllSubject();

}