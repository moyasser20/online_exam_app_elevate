import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/login/presentation/viewmodel/login_viewModel.dart';
import 'package:online_exam_app_elevate/core/di/di.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import '../../../../../core/Assets/app_assets.dart';
import '../../../../../core/Widgets/Custome_Elevated_Button.dart';
import '../../../../../core/Widgets/custom_text_field.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../viewmodel/login_states.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  late final LoginViewModel cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<LoginViewModel>();

    cubit.emailController.addListener(cubit.validateForm);
    cubit.passwordController.addListener(cubit.validateForm);
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
    return BlocProvider<LoginViewModel>(
      create: (_) => cubit,
      child: BlocConsumer<LoginViewModel, loginStates>(
        listener: (context, state) {
          if (state is loginSuccessStates) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Login Successful ✅")),
            );
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
              title: const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            body: Form(
              child: Column(
                children: [
                  CustomeTextFormField(
                    label: "Email",
                    hint: "Enter Your Email",
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ).setHorizontalAndVerticalPadding(context, 0.03, 0.03),
                  CustomeTextFormField(
                    label: "Password",
                    hint: "Enter Your Password",
                    controller: cubit.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
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
                          const Text(
                            "Remember me",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
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
                      : CustomeElevatedButton(
                    text: 'Login',
                    onPressed: cubit.isFormValid
                        ? () {
                      cubit.login(
                        cubit.emailController.text,
                        cubit.passwordController.text,
                      );
                    }
                        : null,
                    color: cubit.isFormValid ? AppColors.blue : Colors.grey,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.SignUp);
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
