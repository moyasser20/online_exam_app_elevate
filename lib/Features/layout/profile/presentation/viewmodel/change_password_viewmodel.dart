  import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:injectable/injectable.dart';
  import 'package:online_exam_app_elevate/Features/layout/profile/data/models/change_password_request_model.dart';
  import 'package:online_exam_app_elevate/Features/layout/profile/domain/usecases/change_password_usecase.dart';
  import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/change_password_states.dart';
import 'package:online_exam_app_elevate/core/storage/token_storage.dart';

  @injectable
  class ChangePasswordViewModel extends Cubit<ChangePasswordStates> {

    final ChangePasswordUseCase _changePasswordUseCase;
    final TokenStorage _tokenStorage;

    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    ChangePasswordViewModel(this._changePasswordUseCase, this._tokenStorage) : super(ChangePasswordInitial());

    Future<void> changePassword() async {
      final model = ChangePasswordRequestModel(
        oldPassword: currentPasswordController.text,
        password: newPasswordController.text,
        rePassword: confirmPasswordController.text,
      );

      emit(ChangePasswordLoading());

      try {
        final newToken = await _changePasswordUseCase(model);
        await _tokenStorage.saveToken(newToken);
        emit(ChangePasswordSuccess());
      } catch (e) {
        emit(ChangePasswordError(e.toString()));
      }
    }

    @override
    Future<void> close(){
      currentPasswordController.dispose();
      newPasswordController.dispose();
      confirmPasswordController.dispose();
      return super.close();
    }


  }