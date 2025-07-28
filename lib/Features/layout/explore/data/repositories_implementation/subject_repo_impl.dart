import 'package:injectable/injectable.dart';

import '../../domain/entity/subjects_entity.dart';
import '../../domain/repositories/subject_repo.dart';
import '../datasource/subject_remote_datasource.dart';
import '../models/subject_model.dart';

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
