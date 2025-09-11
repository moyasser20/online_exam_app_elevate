
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/domain/repositories/profile_data_repo.dart';

import '../../data/models/user_data.dart';

@injectable
class ProfileDataUseCase {
  final ProfileRepo _profileRepo;

  ProfileDataUseCase(this._profileRepo);

  Future<User> call() async{
    return await _profileRepo.getProfileData();
  }

}