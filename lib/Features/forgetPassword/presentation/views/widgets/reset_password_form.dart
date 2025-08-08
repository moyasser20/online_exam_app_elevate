import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/reset_password_cubit.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/states/reset_code_states.dart';
import 'package:online_exam_app_elevate/core/Widgets/Custom_Elevated_Button.dart';
import 'package:online_exam_app_elevate/core/Widgets/custom_text_field.dart';
import 'package:online_exam_app_elevate/core/theme/app_colors.dart';

import '../../../../../core/l10n/translation/app_localizations.dart';

class ResetPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ResetPasswordForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    final cubit = context.watch<ResetPasswordCubit>();
    final state = context.watch<ResetPasswordCubit>().state;

    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: cubit.passwordController,
            validator: cubit.validatePassword,
            label: local.newPasswordLabel,
            hint: local.newPasswordHint,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: cubit.confirmPasswordController,
            validator: cubit.validateConfirmPassword,
            label: local.confirmPasswordLabel,
            hint: local.confirmPasswordLabel,
            obscureText: true,
          ),
          const SizedBox(height: 35),
          state is ResetPasswordLoadingState
              ? const CircularProgressIndicator()
              : CustomElevatedButton(
            text: local.continueButton,
            onPressed: cubit.isFormValid
                ? () {
              if (formKey.currentState!.validate()) {
                cubit.resetPassword();
              }
            }
                : null,
            color: cubit.isFormValid ? AppColors.blue : Colors.grey,
          ),
        ],
      ),
    );
  }
}
