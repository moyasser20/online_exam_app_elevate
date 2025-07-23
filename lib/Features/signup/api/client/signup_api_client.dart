import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/api_constants/end_points.dart';
import '../models/signup_request.dart';
import '../models/signup_response.dart';

part 'signup_api_client.g.dart';

@injectable
@RestApi()
abstract class signupApiClient {
  @factoryMethod
  factory signupApiClient(Dio dio, {@Named('baseUrl') String? baseUrl}) = _signupApiClient;

  @POST(EndPoints.signup)
  Future<SignupResponse> signUp(@Body() SignupRequest request);
}