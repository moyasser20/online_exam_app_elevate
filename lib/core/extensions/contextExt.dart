import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext{



  void goToNamed(String route, {Object? arguments}) =>
      Navigator.of(this).pushNamed(
        route,
        arguments: arguments
      );

  void goToNamedReplace(String route, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(
          route,
          arguments: arguments
      );

  void goBack() => Navigator.of(this).pop();

  void goBackUntil(String UntilRoute) => Navigator.of(this).popUntil(
          (route) => route.settings.name == UntilRoute);


}