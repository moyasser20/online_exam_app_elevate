import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_request_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_response_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/domain/repositories/profile_data_repo.dart';

@injectable
class EditProfileDataUseCase {
  final ProfileRepo _profileRepo;

  EditProfileDataUseCase(this._profileRepo);

  Future<EditProfileResponseModel> call(EditProfileRequestModel model) async {
    return await _profileRepo.editProfile(model);
  }
}
