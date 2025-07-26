import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/forget_password_viewmodel.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/states/forget_password_states.dart';
import 'package:online_exam_app_elevate/core/constants/app_Strings.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import '../../../../../core/Assets/app_assets.dart';
import '../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../core/Widgets/custom_text_field.dart';
import '../../../../../core/extensions/validations.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ForgetPasswordCubit>();
    cubit.emailController.addListener(() {
      cubit.validateEmailField();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ForgetPasswordCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(AppAssets.ArrowIcon),
        ),
        title: Text(
          AppStrings.password,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        builder: (context, state) {
          return Form(
            key: _formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  AppStrings.ForgetPassword,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(height: 10),
                const Text(AppStrings.ForgetPasswordunderText,
                    textAlign: TextAlign.center),
                const SizedBox(height: 40),
                CustomTextFormField(
                  controller: cubit.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.requiredEmailErrorMessage;
                    }
                    if (!Validations.validateEmail(value)) {
                      return AppStrings.validationEmailErrorMessage;
                    }
                    return null;
                  },
                  label: "Email",
                  hint: "Enter your email",
                ),
                const SizedBox(height: 50),
                state is ForgetPasswordLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : CustomElevatedButton(
                  text: "Continue",
                  onPressed: cubit.isFormValid
                      ? () {
                    if (_formState.currentState!.validate()) {
                      cubit.sendResetCode();
                    }
                  }
                      : null,
                  color:
                  cubit.isFormValid ? AppColors.blue : Colors.grey,
                )
              ],
            ).setHorizontalAndVerticalPadding(context, 0.055, 0.05),
          );
        },
        listener: (context, state) {
          if (!mounted) return;

          if (state is ForgetPasswordSuccessState) {
            print("Sending email: ${cubit.emailController.text}");
            Navigator.pushNamed(
              context,
              arguments: cubit.emailController.text,
              AppRoutes.emailVarification,
            );

          } else if (state is ForgetPasswordErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
      ),
    );
  }
}
