import 'package:injectable/injectable.dart';

import '../../data/datasource/change_password_remote_datasource.dart';
import '../../data/models/change_password_request_model.dart';
import '../client/profile_api_client.dart';

@LazySingleton(as: ChangePasswordRemoteDataSource)
class ChangePasswordRemoteDataSourceImpl implements ChangePasswordRemoteDataSource {
  final ProfileApiClient _profileApiClient;

  ChangePasswordRemoteDataSourceImpl({required ProfileApiClient profileApiClient})
      : _profileApiClient = profileApiClient;

  @override
  Future<String> changePassword(ChangePasswordRequestModel model) async {
    final response = await _profileApiClient.changePassword(model);
    return response.token ?? '';
  }
}
