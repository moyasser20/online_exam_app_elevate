import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/verify_code_cubit.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/states/verify_code_states.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../core/Assets/app_assets.dart';
import '../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../core/l10n/translation/app_localizations.dart';
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
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Image.asset(AppAssets.ArrowIcon),
        ),
        title: Text(local.password),
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
                   Text(
                    local.emailVerificationScreen,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                   Text(
                    local.emailVerificationScreenUnderMsg,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  const VerificationCodeField(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        local.codeReceiveMsgError,
                        style: const TextStyle(fontSize: 16),
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
                      : CustomElevatedButton(
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
