
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/domain/usecases/update_password_usecase.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/edit_profile_states.dart';

class EditProfileViewModel extends Cubit<EditProfileStates>{
  final EditProfileDataUseCase _editProfileDataUseCase;

  EditProfileViewModel(this._editProfileDataUseCase) : super(EditProfileInitialState());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();



}