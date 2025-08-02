import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import '../../../../../../core/Assets/app_assets.dart';
import '../../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../../core/Widgets/custom_text_field.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool isFormValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(AppAssets.ArrowIcon),
        ),
        title: Text(
          "Reset Password",
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Form(
        key: _formState,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
              label: "current Password",
              hint: "Enter current password",
            ),
            const SizedBox(height: 25),
            CustomTextFormField(
              label: "New Password",
              hint: "Enter new password",
            ),
            const SizedBox(height: 25),
            CustomTextFormField(
              label: "Confirm Password",
              hint: "Confirm password",
            ),
            const SizedBox(height: 45 ),
            CustomElevatedButton(
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