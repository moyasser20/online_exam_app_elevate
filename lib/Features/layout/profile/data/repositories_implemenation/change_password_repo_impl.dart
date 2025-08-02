import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/datasource/change_password_remote_datasource.dart';

import '../../domain/repositories/change_password_repo.dart';
import '../models/change_password_request_model.dart';

@Injectable(as:ChangePasswordRepo)
class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ChangePasswordRemoteDataSource _remoteDataSource;

  ChangePasswordRepoImpl(this._remoteDataSource);

  @override
  Future<String> changePassword(ChangePasswordRequestModel model) {
    return _remoteDataSource.changePassword(model);
  }
}
