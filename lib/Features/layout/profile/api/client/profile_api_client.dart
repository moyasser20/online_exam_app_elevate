import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/change_password_response_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_response_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/profile_data_model.dart';
import 'package:online_exam_app_elevate/core/constants/api_constants/end_points.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../data/models/change_password_request_model.dart';
import '../../data/models/edit_profile_request_model.dart';

part 'profile_api_client.g.dart';

@injectable
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) =
      _ProfileApiClient;

  @GET(EndPoints.profileData)
  @Extra({'auth': true})
  Future<ProfileDataModel> getProfileData();

  @PATCH(EndPoints.changePassword)
  @Extra({'auth': true})
  Future<ChangePasswordResponseModel> changePassword(
    @Body() ChangePasswordRequestModel model,
  );

  @PUT(EndPoints.editMyProfile)
  @Extra({'auth': true})
  Future<EditProfileResponseModel> editProfile(
    @Body() EditProfileRequestModel model,
  );
}
