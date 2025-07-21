import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/extensions/validations.dart';
import 'states/reset_code_states.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitialState());

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isFormValid = false;

  void initializeListeners() {
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  void _validateForm() {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    final isValid = Validations.validatePassword(password) &&
        password == confirmPassword;

    if (isValid != isFormValid) {
      isFormValid = isValid;
      emit(ResetPasswordInitialState());
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!Validations.validatePassword(value)) {
      return 'Password must be at least 8 characters,\ninclude letters, numbers & special characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirmation is required';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void resetPassword() {
    emit(ResetPasswordLoadingState());

    Future.delayed(const Duration(seconds: 2), () {
      if (passwordController.text == confirmPasswordController.text) {
        emit(ResetPasswordSuccessState());
      } else {
        emit(ResetPasswordErrorState("Passwords do not match"));
      }
    });
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
