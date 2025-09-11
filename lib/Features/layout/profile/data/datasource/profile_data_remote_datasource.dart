import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_request_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_response_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/profile_data_model.dart';

import '../models/change_password_request_model.dart';

abstract class ProfileDataRemoteDatasource {
  Future<ProfileDataModel> getProfileData();
  Future<String> changePassword(ChangePasswordRequestModel model);
  Future<EditProfileResponseModel> editProfile(EditProfileRequestModel model);
}
