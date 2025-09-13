import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/signup/api/models/signup_request.dart';
import 'package:online_exam_app_elevate/Features/signup/presentation/viewmodel/signup_states.dart';
import 'package:online_exam_app_elevate/core/storage/token_storage.dart';

import '../../../../core/extensions/validations.dart';
import '../../domain/usecases/signup_usecase.dart';

@injectable
class SignupViewModel extends Cubit<SignupStates> {
  SignupViewModel(this.signupUseCase, this._tokenStorage)
    : super(SignupInitialStates());

  final SignupUseCase signupUseCase;
  final TokenStorage _tokenStorage;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  bool isFormValid = false;

  void validateForm() {
    final email = emailController.text;
    final password = passwordController.text;
    final rePassword = rePasswordController.text;
    final phone = phoneController.text;
    final username = userNameController.text;
    final firstname = firstNameController.text;
    final lastname = lastNameController.text;

    final emailValid = Validations.validateEmail(email);
    final passwordValid = Validations.validatePassword(password);
    final rePasswordValid = Validations.validateRePassword(
      password,
      rePassword,
    );
    final phoneValid = Validations.validatePhone(phone);
    final usernameValid = Validations.validateUsername(username);
    final firstnameValid = Validations.validateName(firstname);
    final lastnameValid = Validations.validateName(lastname);

    isFormValid =
        emailValid &&
        passwordValid &&
        phoneValid &&
        rePasswordValid &&
        firstnameValid &&
        lastnameValid &&
        usernameValid;
    emit(SignupInitialStates());
  }

  Future<void> signup(
    String email,
    String password,
    String rePassword,
    String phone,
    String username,
    String firstName,
    String lastName,
  ) async {
    emit(SignupLoadingStates());
    try {
      final request = SignupRequest(
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
        username: username,
        firstName: firstName,
        lastName: lastName,
      );
      final response = await signupUseCase(request);
      await _tokenStorage.saveToken(response.token ?? "");
      emit(SignupSuccessStates());
    } catch (e) {
      emit(SignupErrorStates(e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    return super.close();
  }
}
