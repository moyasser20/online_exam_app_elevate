import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/core/storage/token_storage.dart';

import '../../../../core/extensions/validations.dart';
import '../../data/models/login_request.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<loginStates> {
  LoginViewModel(this.loginUseCase, this._tokenStorage) : super(loginIntialStates());

  final LoginUseCase loginUseCase;
  final TokenStorage _tokenStorage;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isFormValid = false;
  bool rememberMe = true;

  void toggleRememberMe(bool value) {
    rememberMe = value;
    emit(loginIntialStates());
  }

  void validateForm() {
    final email = emailController.text;
    final password = passwordController.text;

    final emailValid = Validations.validateEmail(email);
    final passwordValid = Validations.validatePassword(password);

    isFormValid = emailValid && passwordValid;
    emit(loginIntialStates());
  }

  Future<void> login(String email, String password) async {
    emit(loginloadingStates());
    try {
      final request = loginRequest(email: email, password: password);
      final response = await loginUseCase(request);
      await _tokenStorage.saveToken(response.token ?? '');
      emit(loginSuccessStates());
    } catch (e) {
      emit(loginErrorStates(e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}