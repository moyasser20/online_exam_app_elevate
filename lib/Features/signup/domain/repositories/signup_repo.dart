import 'package:online_exam_app_elevate/Features/signup/api/models/signup_request.dart';
import 'package:online_exam_app_elevate/Features/signup/api/models/signup_response.dart';

abstract class SignupRepo{
  Future<SignupResponse> signup(SignupRequest request);
}