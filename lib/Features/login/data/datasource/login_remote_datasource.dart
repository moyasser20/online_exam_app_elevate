import 'package:online_exam_app_elevate/Features/login/data/models/login_response.dart';
import 'package:online_exam_app_elevate/Features/login/data/models/login_request.dart';

abstract class loginRemoteDataSource {
  Future<LoginResponse> login(loginRequest Request);
}
