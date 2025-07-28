import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/api_constants/end_points.dart';
import '../models/signup_request.dart';
import '../models/signup_response.dart';

part 'signup_api_client.g.dart';

@singleton
@RestApi()
abstract class SignupApiClient {
  @factoryMethod
  factory SignupApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) = _SignupApiClient;

  @POST(EndPoints.signup)
  Future<SignupResponse> signUp(@Body() SignupRequest request);
}