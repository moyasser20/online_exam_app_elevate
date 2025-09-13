import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/change_password_request_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/domain/repositories/profile_data_repo.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepo _changePasswordRepo;

  ChangePasswordUseCase(this._changePasswordRepo);

  Future<String> call(ChangePasswordRequestModel model) async {
    return await _changePasswordRepo.changePassword(model);
  }
}
