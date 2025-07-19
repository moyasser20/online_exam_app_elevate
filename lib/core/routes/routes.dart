import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/Features/login/presentation/views/screens/login.dart';
import 'package:online_exam_app_elevate/core/routes/app_routes.dart';

import '../../Features/forgetPassword/presentation/views/screens/ResetPassword.dart';
import '../../Features/forgetPassword/presentation/views/screens/email_varificationScreen.dart';
import '../../Features/forgetPassword/presentation/views/screens/forgertPasswordScreen.dart';

abstract class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (context) => const ForgetPasswordScreen());
      case AppRoutes.emailVarification:
        return MaterialPageRoute(builder: (context) => const EmailVerificationScreen());
      case AppRoutes.ResetPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());

      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
