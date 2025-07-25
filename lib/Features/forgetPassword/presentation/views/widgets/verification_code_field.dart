import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/verify_code_cubit.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/states/verify_code_states.dart';
import 'package:online_exam_app_elevate/core/theme/app_colors.dart';

import '../../../../../core/constants/app_Strings.dart';

class VerificationCodeField extends StatelessWidget {
  const VerificationCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final state = context.watch<VerifyCodeCubit>().state;
    final cubit = context.read<VerifyCodeCubit>();

    return Column(
      children: [
        OtpTextField(
          numberOfFields: 6,
          fieldWidth: 57,
          fieldHeight: 60,
          borderRadius: BorderRadius.circular(8),
          borderColor: state is VerifyCodeErrorStates ? Colors.red : Colors.grey,
          focusedBorderColor: state is VerifyCodeErrorStates ? Colors.red : Colors.blue,
          filled: true,
          fillColor: state is VerifyCodeErrorStates
              ? Colors.red.withOpacity(0.2)
              : AppColors.blue.withOpacity(0.2),
          showFieldAsBox: true,
          onSubmit: (code) => cubit.updateCode(code),
          onCodeChanged: (code) => cubit.updateCode(code),
        ),
        if (state is VerifyCodeErrorStates)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              AppStrings.WrongPasswordErrorMsg,
              style: theme.bodySmall?.copyWith(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
