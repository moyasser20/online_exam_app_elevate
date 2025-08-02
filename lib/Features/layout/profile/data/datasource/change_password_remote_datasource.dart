import 'package:online_exam_app_elevate/Features/layout/profile/data/models/change_password_request_model.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<String> changePassword(ChangePasswordRequestModel model);
}