import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/verify_code_cubit.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/states/verify_code_states.dart';
import 'package:online_exam_app_elevate/core/constants/app_Strings.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../core/Assets/app_assets.dart';
import '../../../../../core/Widgets/Custome_Elevated_Button.dart';
import '../../../../../core/routes/app_routes.dart';
import '../widgets/verification_code_field.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;
  const EmailVerificationScreen({super.key, required this.email});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(widget.email != "") {
      context.read<VerifyCodeCubit>().setEmail(widget.email);
    }
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
              arguments: widget.email,
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
                  const VerificationCodeField(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.CodeReciveMsgError,
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: cubit.isResendEnabled ? () => cubit.resendCode() : null,
                        child: Text(
                          cubit.isResendEnabled ? "Resend" : "Resend",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                            color: cubit.isResendEnabled ? Colors.blue : Colors.grey,
                          ),
                        ),
                      )
                            ],
                  ),
                  state is VerifyCodeLoadingStates
                      ? const CircularProgressIndicator()
                      : CustomeElevatedButton(
                    text: "Next",
                    onPressed: cubit.enteredCode.length == 6
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
