import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/login/data/dataSource/login_remote_datasource.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_response.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_request.dart';
import 'package:online_exam_app_elevate/Features/login/domain/repositories/login_repo.dart';

@Injectable(as: loginRepo)
class loginRepoImplemnation implements loginRepo {

  final loginRemoteDataSource remoteDataSource;

  loginRepoImplemnation(this.remoteDataSource);
  @override
  Future<LoginResponse> login(loginRequest request) {
    return remoteDataSource.login(request);
  }

  

}