import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/constants/app_Strings.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../core/Assets/app_assets.dart';
import '../../../../../core/Widgets/Custome_Elevated_Button.dart';
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
  final TextEditingController _emailController = TextEditingController();

  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      final isValid = Validations.validateEmail(_emailController.text);
      if (isFormValid != isValid) {
        setState(() {
          isFormValid = isValid;
        });
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Form(
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
            const Text(AppStrings.ForgetPasswordunderText, textAlign: TextAlign.center),
            const SizedBox(height: 40),
            CustomeTextFormField(
              controller: _emailController,
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
            CustomeElevatedButton(
              text: "Continue",
              onPressed: isFormValid
                  ? () {
                if (_formState.currentState!.validate()) {
                  Navigator.pushNamed(context, AppRoutes.emailVarification);
                }
              }
                  : null,
              color: isFormValid ? AppColors.blue : Colors.grey,
            )
          ],
        ).setHorizontalAndVerticalPadding(context, 0.055, 0.05),
      ),
    );
  }
}

