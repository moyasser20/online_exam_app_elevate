import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/profile_states.dart';
import '../../domain/usecases/profile_data_usecase.dart';
import '../../data/models/user_data.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  final ProfileDataUseCase _getProfileUseCase;

  ProfileViewModel(this._getProfileUseCase) : super(ProfileInitialState());

  User? profileUser;

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    try {
      final user = await _getProfileUseCase();
      profileUser = user;
      emit(ProfileSuccessState(user));
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }
}
