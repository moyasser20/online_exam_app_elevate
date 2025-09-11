
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_request_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_response_model.dart';

import '../../data/models/change_password_request_model.dart';
import '../../data/models/user_data.dart';

abstract class ProfileRepo {


  Future<User> getProfileData();

  Future<String> changePassword(ChangePasswordRequestModel model);

  Future<EditProfileResponseModel> editProfile(EditProfileRequestModel model);

}