
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/data/dataSource/forget_password_datasource.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/data/models/forget_password_request.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/data/models/reset_password_request_model.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/data/models/verify_code_request_model.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/domain/repositories/forget_password_repo.dart';
import 'package:online_exam_app_elevate/core/constants/failure_messages.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImp implements ForgetPasswordRepo {
  final ForgetPasswordRemoteDataSource remoteDataSource;

  ForgetPasswordRepoImp(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> forgotPassword(String email)  async{
    try{
      final model = ForgetPasswordRequestModel(email: email);
      await remoteDataSource.forgetPassword(model);
      return Right(null);
    } catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email, String newPassword) async {
  try{
    final model = ResetPasswordRequestModel(email: email , newPassword: newPassword);
    await remoteDataSource.resetPassword(model);
    return Right(null);
  }catch(e) {
    return Left(ServerFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure, void>> verifyResetCode(String code) async{
    try{
      final model= VerifyCodeRequestModel(resetCode: code);
      await remoteDataSource.verifyResetPassword(model);
      return Right(null);
    }catch(e) {
      return Left(ServerFailure(e.toString()));
    }
  }

}