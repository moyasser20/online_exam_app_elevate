import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/login/api/client/login_api_client.dart';
import 'package:online_exam_app_elevate/Features/login/data/dataSource/login_remote_datasource.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_response.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_request.dart';

@LazySingleton(as: loginRemoteDataSource)
class LoginRemoteDataSourceImpl implements loginRemoteDataSource {
  final loginApiClient apiClient;

  LoginRemoteDataSourceImpl(this.apiClient);

  @override
  Future<LoginResponse> login(loginRequest request) {
    return apiClient.signIn(request);
  }
}
