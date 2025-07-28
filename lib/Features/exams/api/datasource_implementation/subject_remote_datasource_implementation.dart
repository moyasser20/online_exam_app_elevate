import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/data/datasource/subject_remote_datasource.dart';
import 'package:online_exam_app_elevate/Features/exams/data/models/subject_model.dart';

import '../client/exam_api_client.dart';


@LazySingleton(as: SubjectRemoteDataSource)
class SubjectsRemoteDataSourceImpl implements SubjectRemoteDataSource {

  final ExamApiClient examApiClient;


  SubjectsRemoteDataSourceImpl(this.examApiClient);

  @override
  Future<List<SubjectModel>> getAllSubject() => examApiClient.getAllSubjects();



}