import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants/constants.dart';
import '../../../../core/constants/api_constants/end_points.dart';
import '../../data/models/login_response.dart';
import '../../data/models/login_request.dart';

part 'login_api_client.g.dart';
@injectable
@RestApi()
abstract class loginApiClient {
  @factoryMethod
  factory loginApiClient(Dio dio, {@Named('baseUrl') String? baseUrl}) = _loginApiClient;

  @POST(EndPoints.signIn)
  Future<LoginResponse> signIn(@Body() loginRequest request);
}