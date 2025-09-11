import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/di/di.dart';
import 'package:online_exam_app_elevate/core/routes/app_routes.dart';
import 'core/l10n/translation/app_localizations.dart';
import 'core/routes/routes.dart';
import 'core/theme/app_theme.dart';
import 'Features/login/presentation/viewmodel/login_viewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  final loginViewModel = getIt<LoginViewModel>();
  final canAutoLogin = await loginViewModel.checkAutoLogin();

  runApp(MyApp(canAutoLogin: canAutoLogin));
}

class MyApp extends StatelessWidget {
  final bool canAutoLogin;

  const MyApp({super.key, required this.canAutoLogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: canAutoLogin ? AppRoutes.layout : AppRoutes.login,
      onGenerateRoute: Routes.generateRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("en"),
    );
  }
}
