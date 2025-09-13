import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/core/constants/failure_messages.dart';

import '../repositories/forget_password_repo.dart';

@injectable
class VerifyCodeUseCase {
  final ForgetPasswordRepo _forgetPasswordRepo;

  VerifyCodeUseCase(this._forgetPasswordRepo);

  Future<Either<Failure, void>> call(String code) {
    return _forgetPasswordRepo.verifyResetCode(code);
  }
}
