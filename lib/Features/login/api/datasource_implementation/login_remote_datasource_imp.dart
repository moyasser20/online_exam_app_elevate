import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/login/api/client/login_api_client.dart';
import 'package:online_exam_app_elevate/Features/login/data/datasource/login_remote_datasource.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_response.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_request.dart';

import '../../data/datasource/login_remote_datasource.dart';

@LazySingleton(as: loginRemoteDataSource)
class LoginRemoteDataSourceImpl implements loginRemoteDataSource {
  final loginApiClient _apiClient;

  LoginRemoteDataSourceImpl(this._apiClient);

  @override
  Future<LoginResponse> login(loginRequest request) async{
    return await _apiClient.signIn(request);
  }
}