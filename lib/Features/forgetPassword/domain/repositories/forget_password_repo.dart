import 'package:dartz/dartz.dart';

import '../../../../core/constants/failure_messages.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, void>> verifyResetCode(String code);
  Future<Either<Failure, void>> resetPassword(String email, String newPassword);
}
