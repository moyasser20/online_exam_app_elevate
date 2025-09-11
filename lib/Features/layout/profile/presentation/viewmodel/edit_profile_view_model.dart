
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/data/models/edit_profile_request_model.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/domain/usecases/update_data_usecase.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/edit_profile_states.dart';

import '../../../../../core/storage/token_storage.dart';
import '../../data/models/user_data.dart';

class EditProfileViewModel extends Cubit<EditProfileStates>{
  final EditProfileDataUseCase _editProfileDataUseCase;

  EditProfileViewModel(this._editProfileDataUseCase) : super(EditProfileInitialState());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  void setInitialData(User user) {
    usernameController.text = user.username ?? '';
    firstnameController.text = user.firstName ?? '';
    lastnameController.text = user.lastName ?? '';
    emailController.text = user.email ?? '';
    phoneController.text = user.phone ?? '';
  }


  Future<void> submitProfileUpdate() async {
    emit(EditProfileLoadingState());

    try {
      final request = EditProfileRequestModel(
        username: usernameController.text,
        firstName: firstnameController.text,
        lastName: lastnameController.text,
        email: emailController.text,
        phone: phoneController.text,
      );


      final response = await _editProfileDataUseCase(request);

      emit(EditProfileSuccessState(message: response.message));
    } catch (e) {
      emit(EditProfileErrorState(message: e.toString()));
    }
  }





  @override
  Future<void> close() {
    usernameController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    return super.close();
  }


}