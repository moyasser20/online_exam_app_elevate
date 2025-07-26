
import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/di/di.dart';
import 'package:online_exam_app_elevate/core/routes/app_routes.dart';
import 'core/l10n/translation/app_localizations.dart';
import 'core/routes/routes.dart';
import 'core/theme/app_theme.dart';

void main()
async{
   await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      onGenerateRoute: Routes.generateRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("en"),

    );
  }
}