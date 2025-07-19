import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:online_exam_app_elevate/core/constants/app_Strings.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../core/Assets/app_assets.dart';
import '../../../../../core/Widgets/Custome_Elevated_Button.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  String _enteredCode = '';
  bool _isCodeInvalid = false;

  final String _correctCode = '1234';

  void _validateCode(String code) {
    setState(() {
      _enteredCode = code;
      _isCodeInvalid = code != _correctCode;
    });
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                borderColor: _isCodeInvalid ? Colors.red : Colors.grey,
                focusedBorderColor: _isCodeInvalid ? Colors.red : Colors.blue,
                filled: true,
                fillColor: _isCodeInvalid
                    ? Colors.red.withOpacity(0.2)
                    : AppColors.blue.withOpacity(0.2),
                showFieldAsBox: true,
                onSubmit: _validateCode,
              ),
              if (_isCodeInvalid)
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
                    },
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.5,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
        
              CustomeElevatedButton(text: "Next", onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.ResetPasswordScreen);
              })
            ],
          ).setVerticalPadding(context, 0.04),
        ),
      ),
    );
  }
}

