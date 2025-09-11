import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/forget_password_usecase.dart';
import '../../presentation/viewmodel/states/forget_password_states.dart';
import '../../../../../core/extensions/validations.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordCubit(this._forgetPasswordUseCase)
    : super(ForgetPasswordInitialState());

  final TextEditingController emailController = TextEditingController();
  bool isFormValid = false;

  void validateEmailField() {
    final isValid = Validations.validateEmail(emailController.text);
    if (isFormValid != isValid) {
      isFormValid = isValid;
      emit(ForgetPasswordInitialState());
    }
  }

  Future<void> sendResetCode() async {
    final email = emailController.text;
    emit(ForgetPasswordLoadingState());

    final result = await _forgetPasswordUseCase(email);
    result.fold(
      (failure) => emit(ForgetPasswordErrorState(failure.message)),
      (_) => emit(ForgetPasswordSuccessState()),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
