
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_request_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_response_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/profile_data_model.dart';

import '../../data/datasource/profile_data_remote_datasource.dart';
import '../../data/models/change_password_request_model.dart';
import '../client/profile_api_client.dart';

@LazySingleton(as:ProfileDataRemoteDatasource)
class ProfileRemoteDataSourceImpl implements ProfileDataRemoteDatasource{
    final ProfileApiClient _apiClient;

    ProfileRemoteDataSourceImpl({required ProfileApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<ProfileDataModel> getProfileData()async {
    return await _apiClient.getProfileData();
  }

    @override
    Future<String> changePassword(ChangePasswordRequestModel model) async {
      final response = await _apiClient.changePassword(model);
      return response.token ?? '';
    }

  @override
  Future<EditProfileResponseModel> editProfile(EditProfileRequestModel model)async {
    final response = await _apiClient.editProfile(model);
    return response;
  }

}