

import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_request_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_response_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/domain/repositories/profile_data_repo.dart';
import 'package:online_exam_app_elevate/Features/login/domain/entities/user_entity.dart';

import '../datasource/profile_data_remote_datasource.dart';
import '../models/change_password_request_model.dart';
import '../models/user_data.dart';

@Injectable(as:ProfileRepo)
class ProfileDataRepoImpl implements ProfileRepo {
  final ProfileDataRemoteDatasource dataRemoteDatasource;

  ProfileDataRepoImpl(this.dataRemoteDatasource);

  @override
  Future<User> getProfileData()async {
    final model = await dataRemoteDatasource.getProfileData();
    final user = model.user;

    return User(
      Id: user?.Id,
      username: user?.username,
      firstName: user?.firstName,
      lastName: user?.lastName,
      email: user?.email,
      phone: user?.phone,
      role: user?.role,
      isVerified: user?.isVerified,
      createdAt: user?.createdAt,
    );
  }

  @override
  Future<String> changePassword(ChangePasswordRequestModel model) {
    return dataRemoteDatasource.changePassword(model);
  }

  @override
  Future<EditProfileResponseModel> editProfile(EditProfileRequestModel model) async{
    try {
      return await dataRemoteDatasource.editProfile(model);
    } catch(e) {
      throw e.toString();
    }
  }
  
}