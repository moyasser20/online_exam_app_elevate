import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/change_password_viewmodel.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import 'package:online_exam_app_elevate/core/extensions/validations.dart';
import '../../../../../../core/Assets/app_assets.dart';
import '../../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../../core/Widgets/custom_text_field.dart';
import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../viewmodel/change_password_states.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    final viewmodel = context.read<ChangePasswordViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(AppAssets.ArrowIcon),
        ),
        title: Text(
          local.resetPassword,
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocConsumer<ChangePasswordViewModel, ChangePasswordStates>(
        listener: (context, state) {
          if (state is ChangePasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.message,
                style: TextStyle(color: AppColors.red),
              ),
            ));
          } else if (state is ChangePasswordSuccess) {

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                local.passwordChangeText,
                style: TextStyle(color: AppColors.green),
              ),
            ));

            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
        },
        builder: (context, state) {
          return Form(
            key: _formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: viewmodel.currentPasswordController,
                  label: local.currentPasswordLabel,
                  hint: local.currentPasswordHint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return local.resetPasswordUnderMsg;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                CustomTextFormField(
                  controller: viewmodel.newPasswordController,
                  label: local.newPasswordLabel,
                  hint: local.newPasswordHint,
                  validator: (value) {
                    if (value == null || !Validations.validatePassword(value)) {
                      return local.resetPasswordUnderMsg;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                CustomTextFormField(
                  controller: viewmodel.confirmPasswordController,
                  label: local.confirmPasswordLabel,
                  hint: local.confirmPasswordHint,
                  validator: (value) {
                    if (!Validations.validateRePassword(
                        viewmodel.newPasswordController.text, value ?? '')) {
                      return local.passwordErrorMatchingMsg;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 45),
                CustomElevatedButton(
                  text: local.continueButton,
                  onPressed: () {
                    if (_formState.currentState!.validate()) {
                      viewmodel.changePassword();
                    }
                  },
                  color: AppColors.blue,
                ),
              ],
            ).setHorizontalAndVerticalPadding(context, 0.055, 0.05),
          );
        },
      ),
    );
  }
}
