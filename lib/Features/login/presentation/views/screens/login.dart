import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/login/presentation/viewmodel/login_viewModel.dart';
import 'package:online_exam_app_elevate/core/di/di.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import 'package:online_exam_app_elevate/core/extensions/validations.dart';
import '../../../../../core/Assets/app_assets.dart';
import '../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../core/Widgets/custom_text_field.dart';
import '../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../viewmodel/login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen> {
  late final LoginViewModel cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<LoginViewModel>();

    cubit.emailController.addListener(cubit.validateForm);
    cubit.passwordController.addListener(cubit.validateForm);
    cubit.loadRememberedData();
  }

  @override
  void dispose() {
    cubit.emailController.removeListener(cubit.validateForm);
    cubit.passwordController.removeListener(cubit.validateForm);
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return BlocProvider<LoginViewModel>(
      create: (_) => cubit,
      child: BlocConsumer<LoginViewModel, loginStates>(
        listener: (context, state) async {
          if (state is loginSuccessStates) {
            final token = await context.read<LoginViewModel>().getToken();
            //print('Token after login: $token');

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(local.loginSuccessMsg),
                duration: const Duration(seconds: 1),
              ),
            );

            await Future.delayed(const Duration(seconds: 1));
            Navigator.of(context).pushReplacementNamed(AppRoutes.layout);

          } else if (state is loginErrorStates) {
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
          final cubit = context.watch<LoginViewModel>();

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Image.asset(AppAssets.ArrowIcon),
              ),
              title: Text(
                local.loginElevatedButton,
                style: theme.textTheme.headlineMedium,
              ),
            ),
            body: Form(
              child: Column(
                children: [
                  CustomTextFormField(
                    label: "Email",
                    hint: "Enter Your Email",
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!Validations.validateEmail(value)) {
                        return "This Email is not valid";
                      }
                      return null;
                    },
                  ).setHorizontalAndVerticalPadding(context, 0.03, 0.03),
                  CustomTextFormField(
                    label: "Password",
                    hint: "Enter Your Password",
                    obscureText: true,
                    controller: cubit.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (!Validations.validatePassword(value)) {
                        return "must be at least 6 characters and have {M#12m}";
                      }
                      return null;
                    },
                  ).setHorizontalAndVerticalPadding(context, 0.03, 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: cubit.rememberMe,
                            onChanged: (value) {
                              cubit.toggleRememberMe(value ?? true);
                            },
                          ),
                          Text(
                            local.rememberMeBox,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(AppRoutes.forgetPassword);
                        },
                        child: Text(
                          local.forgetPasswordTextButton,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  state is loginloadingStates
                      ? const CircularProgressIndicator()
                      : CustomElevatedButton(
                        text: local.loginElevatedButton,
                        onPressed:
                            cubit.isFormValid
                                ? () {
                                  cubit.login(
                                    cubit.emailController.text,
                                    cubit.passwordController.text,
                                  );
                                  // Navigator.of(context).pushNamed(AppRoutes.layout);
                                }
                                : null,
                        color: cubit.isFormValid ? AppColors.blue : Colors.grey,
                      ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        local.doNotHaveAnAccountText,
                        style: const TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signUp);
                        },
                        child: Text(
                          local.signup,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            fontSize: 18,
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
