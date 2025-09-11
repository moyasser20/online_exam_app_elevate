import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/domain/repositories/forget_password_repo.dart';
import 'package:online_exam_app_elevate/core/constants/failure_messages.dart';

@injectable
class ResetPasswordUseCase {
  final ForgetPasswordRepo _forgetPasswordRepo;

  ResetPasswordUseCase(this._forgetPasswordRepo);

  Future<Either<Failure, void>> call(String email, String newPassword) {
    return _forgetPasswordRepo.resetPassword(email, newPassword);
  }
}
