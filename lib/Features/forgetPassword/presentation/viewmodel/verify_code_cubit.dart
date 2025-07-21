import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/domain/usecases/verify_code_usecase.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/states/verify_code_states.dart';

@injectable
class VerifyCodeCubit extends Cubit<VerifyCodeStates> {
  final VerifyCodeUseCase _verifyCodeUseCase;

  String enteredCode = '';

  VerifyCodeCubit(this._verifyCodeUseCase) : super(VerifyCodeInitialStates());

  void updateCode(String code) {
    enteredCode = code;
    emit(VerifyCodeInitialStates());
  }

  Future<void> verify() async {
    if (enteredCode.length < 6) {
      emit(VerifyCodeErrorStates("Code must be 6 digits"));
      return;
    }

    emit(VerifyCodeLoadingStates());

    final result = await _verifyCodeUseCase(enteredCode);

    result.fold(
          (failure) => emit(VerifyCodeErrorStates(failure.message)),
          (_) => emit(VerifyCodeSuccessStates()),
    );
  }
}
