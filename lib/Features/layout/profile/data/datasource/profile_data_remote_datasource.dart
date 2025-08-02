import 'package:online_exam_app_elevate/Features/layout/profile/data/models/profile_data_model.dart';

abstract class ProfileDataRemoteDatasource {
  Future<ProfileDataModel> getProfileData();
}