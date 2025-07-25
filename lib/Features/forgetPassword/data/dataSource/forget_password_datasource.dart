import '../models/forget_password_request.dart';
import '../models/reset_password_request_model.dart';
import '../models/verify_code_request_model.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<void> forgetPassword(ForgetPasswordRequestModel forgetpasswordrequestmodel);
  Future<void> verifyResetPassword(VerifyCodeRequestModel verifyCodeRequestModel);
  Future<void> resetPassword(ResetPasswordRequestModel resetPasswordRequestModel);
}