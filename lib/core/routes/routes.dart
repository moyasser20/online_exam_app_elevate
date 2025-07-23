import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/Features/login/presentation/views/screens/login.dart';
import '../../Features/signup/presentation/views/screens/signUp.dart';
import 'app_routes.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
