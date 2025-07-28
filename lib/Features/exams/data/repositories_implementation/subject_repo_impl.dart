import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/data/datasource/subject_remote_datasource.dart';
import 'package:online_exam_app_elevate/Features/exams/data/models/subject_model.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/entity/subjects_entity.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/repositories/subject_repo.dart';

@LazySingleton(as: SubjectRepo)
class SubjectsRepoImpl implements SubjectRepo {
  final SubjectRemoteDataSource _remoteDataSource;

  SubjectsRepoImpl(this._remoteDataSource);

  @override
  Future<List<SubjectEntity>> getAllSubjects() async {
    final List<SubjectModel> models = await _remoteDataSource.getAllSubject();

    return models
        .map(
          (models) => SubjectEntity(
            id: models.id,
            name: models.name,
            icon: models.icon,
            createdAt: models.createdAt,
          ),
        )
        .toList();
  }
}
