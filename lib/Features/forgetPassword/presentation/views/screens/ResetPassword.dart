import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/reset_password_cubit.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/states/reset_code_states.dart';
import 'package:online_exam_app_elevate/core/constants/app_Strings.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../core/Assets/app_assets.dart';
import '../../../../../core/Widgets/Custome_Elevated_Button.dart';
import '../../../../../core/Widgets/custom_text_field.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<ResetPasswordCubit>().initializeListeners();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as String;
    context.read<ResetPasswordCubit>().setEmail(args);
  }


  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ResetPasswordCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(AppAssets.ArrowIcon),
        ),
        title: Text(
          AppStrings.password,
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            Navigator.pushNamed(context, AppRoutes.login);
          } else if (state is ResetPasswordErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  AppStrings.ResetPassword,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(height: 10),
                const Text(
                  AppStrings.ResetPasswordunderMsg,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                CustomeTextFormField(
                  controller: cubit.passwordController,
                  validator: cubit.validatePassword,
                  label: "New Password",
                  hint: "Enter your password",
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                CustomeTextFormField(
                  controller: cubit.confirmPasswordController,
                  validator: cubit.validateConfirmPassword,
                  label: "Confirm Password",
                  hint: "Confirm password",
                  obscureText: true,
                ),
                const SizedBox(height: 45),
                state is ResetPasswordLoadingState
                    ? const CircularProgressIndicator()
                    : CustomeElevatedButton(
                  text: "Continue",
                  onPressed: cubit.isFormValid
                      ? () {
                    if (_formKey.currentState!.validate()) {
                      cubit.resetPassword();
                    }
                  }
                      : null,
                  color: cubit.isFormValid ? AppColors.blue : Colors.grey,
                ),
              ],
            ).setHorizontalAndVerticalPadding(context, 0.055, 0.05),
          );
        },
      ),
    );
  }
}
