import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/Features/login/presentation/views/screens/login.dart';

abstract class Routes {

  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    return MaterialPageRoute(builder: (settings) => const loginScreen() );
  }
}
