
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants/end_points.dart';
import '../../data/models/forget_password_request.dart';
import '../../data/models/reset_password_request_model.dart';
import '../../data/models/verify_code_request_model.dart';
part 'forget_password_client.g.dart';

@injectable
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) = _ForgetPasswordApiClient;

  @POST(EndPoints.forgetPassword)
  Future<void> forgetPassword(@Body() ForgetPasswordRequestModel forgetPasswordRequestModel);
  
  @POST(EndPoints.verifyResetCode)
  Future<void> verifyResetcode(@Body() VerifyCodeRequestModel verifResetCode);

  @POST("resetPassword")
  Future<void> resetPassword(@Body() ResetPasswordRequestModel resetPasswordRequestModel);


  }