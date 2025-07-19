import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/login/data/datasource/login_remote_datasource.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_response.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_request.dart';
import 'package:online_exam_app_elevate/Features/login/domain/repositories/login_repo.dart';

import '../datasource/login_remote_datasource.dart';

@Injectable(as: loginRepo)
class loginRepoImplemnation implements loginRepo {

  final loginRemoteDataSource _remoteDataSource;

  loginRepoImplemnation(this._remoteDataSource);
  @override
  Future<LoginResponse> login(loginRequest request) {
    return _remoteDataSource.login(request);
  }



}