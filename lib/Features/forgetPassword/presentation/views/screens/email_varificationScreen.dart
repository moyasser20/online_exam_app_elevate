import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/verify_code_cubit.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/states/verify_code_states.dart';
import 'package:online_exam_app_elevate/core/constants/app_Strings.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../core/Assets/app_assets.dart';
import '../../../../../core/Widgets/Custome_Elevated_Button.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  String? email;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arg = ModalRoute.of(context)?.settings.arguments as String;
      email = arg;
      context.read<VerifyCodeCubit>().setEmail(email!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Image.asset(AppAssets.ArrowIcon),
        ),
        title: const Text(AppStrings.password),
      ),
      body: BlocConsumer<VerifyCodeCubit, VerifyCodeStates>(
        listener: (context, state) {
          if (state is VerifyCodeSuccessStates) {
            Navigator.pushNamed(
              context,
              AppRoutes.ResetPasswordScreen,
              arguments: email,
            );
          } else if (state is VerifyCodeErrorStates) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final cubit = context.watch<VerifyCodeCubit>();

          return SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.EmailVarficationScreen,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    AppStrings.EmailVarficationScreenUnderMsg,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  OtpTextField(
                    numberOfFields: 6,
                    fieldWidth: 57,
                    fieldHeight: 60,
                    borderRadius: BorderRadius.circular(8),
                    borderColor:
                        state is VerifyCodeErrorStates
                            ? Colors.red
                            : Colors.grey,
                    focusedBorderColor:
                        state is VerifyCodeErrorStates
                            ? Colors.red
                            : Colors.blue,
                    filled: true,
                    fillColor:
                        state is VerifyCodeErrorStates
                            ? Colors.red.withOpacity(0.2)
                            : AppColors.blue.withOpacity(0.2),
                    showFieldAsBox: true,
                    onSubmit: (code) => cubit.updateCode(code),
                    onCodeChanged: (code) => cubit.updateCode(code),
                  ),
                  if (state is VerifyCodeErrorStates)
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(
                        AppStrings.CodeErrorMsg,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.CodeReciveMsgError,
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: Handle resend here
                        },
                        child: const Text(
                          "Resend",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  state is VerifyCodeLoadingStates
                      ? const CircularProgressIndicator()
                      : CustomeElevatedButton(
                        text: "Next",
                        onPressed:
                            cubit.enteredCode.length == 6
                                ? () {
                                  cubit.verify(context);
                                }
                                : null,
                      ),
                ],
              ).setVerticalPadding(context, 0.04),
            ),
          );
        },
      ),
    );
  }
}
