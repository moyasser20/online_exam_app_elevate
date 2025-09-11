import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/signup/api/models/signup_request.dart';
import 'package:online_exam_app_elevate/Features/signup/api/models/signup_response.dart';

import '../../data/datasource/signup_remote_datasource.dart';
import '../client/signup_api_client.dart';

@LazySingleton(as: SignupRemoteDatasource)
class SignupRemoteDataSourceImpl implements SignupRemoteDatasource {
  final SignupApiClient _apiClient;

  SignupRemoteDataSourceImpl(this._apiClient);

  @override
  Future<SignupResponse> signup(SignupRequest request) async {
    return await _apiClient.signUp(request);
  }
}
