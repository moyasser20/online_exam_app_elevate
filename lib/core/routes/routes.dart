import 'package:flutter/material.dart';

abstract class Routes {

  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    return MaterialPageRoute(builder: (settings) => const Scaffold(

    ));
  }
}
