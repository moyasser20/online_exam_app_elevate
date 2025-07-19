

import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/api/client/forget_password_client.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/data/dataSource/forget_password_datasource.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/data/models/forget_password_request.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/data/models/reset_password_request_model.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/data/models/verify_code_request_model.dart';

@Injectable(as:ForgetPasswordDataSource )
class ForgetPasswordRemoteDataSourceImp implements ForgetPasswordDataSource {
  final ForgetPasswordApiClient _apiClient;

  ForgetPasswordRemoteDataSourceImp(this._apiClient);

  @override
  Future<void> forgetPassword(ForgetPasswordRequestModel forgetpasswordrequestmodel) async{
    return await _apiClient.forgetPassword(forgetpasswordrequestmodel);
  }

  @override
  Future<void> resetPassword(ResetPasswordRequestModel resetPasswordRequestModel) async{
    return await _apiClient.resetPassword(resetPasswordRequestModel);
  }

  @override
  Future<void> verifyResetPassword(VerifyCodeRequestModel verifyCodeRequestModel) async{
    return await _apiClient.verifyResetcode(verifyCodeRequestModel);
  }
  
}