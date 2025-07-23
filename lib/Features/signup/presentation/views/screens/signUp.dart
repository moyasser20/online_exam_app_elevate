import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/signup/presentation/viewmodel/signup_view_model.dart';
import 'package:online_exam_app_elevate/core/Assets/app_assets.dart';
import 'package:online_exam_app_elevate/core/Widgets/Custom_Elevated_Button.dart';
import 'package:online_exam_app_elevate/core/Widgets/custom_text_field.dart';
import 'package:online_exam_app_elevate/core/constants/app_strings.dart';
import 'package:online_exam_app_elevate/core/extensions/padding_ext.dart';
import 'package:online_exam_app_elevate/core/routes/app_routes.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/extensions/validations.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../viewmodel/signup_states.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final SignupViewModel cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<SignupViewModel>();

    cubit.emailController.addListener(cubit.validateForm);
    cubit.passwordController.addListener(cubit.validateForm);
    cubit.rePasswordController.addListener(cubit.validateForm);
    cubit.userNameController.addListener(cubit.validateForm);
    cubit.firstNameController.addListener(cubit.validateForm);
    cubit.lastNameController.addListener(cubit.validateForm);
    cubit.phoneController.addListener(cubit.validateForm);
  }

  @override
  void dispose() {
    cubit.emailController.removeListener(cubit.validateForm);
    cubit.passwordController.removeListener(cubit.validateForm);
    cubit.rePasswordController.removeListener(cubit.validateForm);
    cubit.userNameController.removeListener(cubit.validateForm);
    cubit.firstNameController.removeListener(cubit.validateForm);
    cubit.lastNameController.removeListener(cubit.validateForm);
    cubit.phoneController.removeListener(cubit.validateForm);
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<SignupViewModel>(
      create: (_) => cubit,
      child: BlocConsumer<SignupViewModel, SignupStates>(
        listener: (context, state) {
          if (state is SignupSuccessStates) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppStrings.signupSuccessMsg)),
            );
          } else if (state is SignupErrorStates) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.watch<SignupViewModel>();

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Image.asset(AppAssets.ArrowIcon),
              ),
              title:  Text(
                "Sign Up",
                style: theme.textTheme.headlineMedium,
              ),
            ),
            body: Form(
              child: Column(
                children: [
                  CustomTextFormField(
                    label: "User Name",
                    hint: "Enter User Name",
                    controller: cubit.userNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "User name is required";
                      }
                      if(!Validations.validateUsername(value)){
                        return "This user name is not valid";
                      }
                      return null;
                    },
                  ).setHorizontalAndVerticalPadding(context, 0.05, 0.005),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextFormField(
                          label: 'First Name',
                          hint: "Enter first name",
                          controller: cubit.firstNameController,
                          validator: (value) {
                            if(value == null ||!Validations.validateName(value)){
                              return "Enter First name";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextFormField(
                          label: 'Last Name',
                          hint: "Enter Last name",
                          controller: cubit.lastNameController,
                          validator: (value) {
                            if(value == null ||!Validations.validateName(value)){
                              return "Enter Last name";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ).setHorizontalAndVerticalPadding(context, 0.003, 0.03),
                  CustomTextFormField(
                    label: "Email",
                    hint: "Enter your Email",
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if(!Validations.validateEmail(value)) {
                        return "This Email is not valid";
                      }
                      return null;
                    },
                  ).setHorizontalAndVerticalPadding(context, 0.05, 0.005),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextFormField(
                          label: 'Password',
                          hint: "Enter Password",
                          controller: cubit.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if(!Validations.validatePassword(value)){
                              return "must be at least 6 characters and have {M#12m}";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextFormField(
                          label: 'Confirm Password',
                          hint: "Confirm Password",
                          controller: cubit.rePasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if(!Validations.validateRePassword(cubit.passwordController.text,value)){
                              return "Password not matched";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ).setHorizontalAndVerticalPadding(context, 0.003, 0.03),
                  CustomTextFormField(
                    label: "Phone Number",
                    hint: "Enter phone number",
                    controller: cubit.phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required";
                      }
                      if(!Validations.validatePhone(value)){
                        return "Enter a valid number";
                      }
                      return null;
                    },
                  ).setHorizontalAndVerticalPadding(context, 0.05, 0.005),
                  const SizedBox(height: 50),
                  state is SignupLoadingStates
                      ? const CircularProgressIndicator()
                      : CustomElevatedButton(
                    text: AppStrings.signupElevatedButton,
                    onPressed: cubit.isFormValid
                        ? () {
                      cubit.signup(
                        cubit.emailController.text,
                        cubit.passwordController.text,
                        cubit.rePasswordController.text,
                        cubit.phoneController.text,
                        cubit.userNameController.text,
                        cubit.firstNameController.text,
                        cubit.lastNameController.text,
                      );
                    }
                        : null,
                    color: cubit.isFormValid ? AppColors.blue : Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.haveAccText,
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        child: const Text(
                          AppStrings.loginTextButton,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            decorationThickness: 2,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
