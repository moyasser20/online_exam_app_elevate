import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/signup/api/models/signup_request.dart';
import 'package:online_exam_app_elevate/Features/signup/api/models/signup_response.dart';
import 'package:online_exam_app_elevate/Features/signup/domain/repositories/signup_repo.dart';

@injectable
class SignupUseCase {
  SignupRepo signupRepo;
  SignupUseCase(this.signupRepo);

  Future<SignupResponse> call(SignupRequest request) {
    return signupRepo.signup(request);
  }
}
