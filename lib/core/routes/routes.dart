import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/forgetPassword/presentation/viewmodel/verify_code_cubit.dart';
import 'package:online_exam_app_elevate/Features/layout/profile/presentation/viewmodel/change_password_viewmodel.dart';
import 'package:online_exam_app_elevate/Features/login/presentation/views/screens/login.dart';
import '../../Features/exams/exam_questions/presenation/view/screens/exam_score_screen.dart';
import '../../Features/exams/exam_questions/presenation/view/screens/question_screen.dart';
import '../../Features/exams/exam_subject/presentation/views/screens/exam_details_screen.dart';
import '../../Features/exams/exam_subject/presentation/views/screens/exams_screen.dart';
import '../../Features/layout/layout_screen.dart';
import '../../Features/layout/profile/presentation/views/screens/change_password_screen.dart';
import '../../Features/signup/presentation/views/screens/signUp.dart';
import 'app_routes.dart';
import '../../Features/forgetPassword/presentation/viewmodel/reset_password_cubit.dart';
import '../../Features/forgetPassword/presentation/views/screens/ResetPassword.dart';
import '../../Features/forgetPassword/presentation/views/screens/email_varificationScreen.dart';
import '../../Features/forgetPassword/presentation/views/screens/forgertPasswordScreen.dart';
import '../../Features/forgetPassword/presentation/viewmodel/forget_password_viewmodel.dart';

import '../di/di.dart';

abstract class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case AppRoutes.forgetPassword:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (_) => getIt<ForgetPasswordCubit>(),
                child: const ForgetPasswordScreen(),
              ),
        );

      case AppRoutes.emailVarification:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (_) => getIt<VerifyCodeCubit>(),
                child: EmailVerificationScreen(email: email),

              ),
        );

      case AppRoutes.ResetPasswordScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (_) => getIt<ResetPasswordCubit>(),
                child: ResetPasswordScreen(email: email),
              ),
        );

      case AppRoutes.questionsScreen:
        return MaterialPageRoute(builder: (context) => const QuestionScreen());

      case AppRoutes.examScoreScreen:
        return MaterialPageRoute(
          builder:
              (context) =>
                  const ExamScoreScreen(correctAnswer: 10, totalQuestion: 10),
        );

      case AppRoutes.layout:
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
      case AppRoutes.changePassword:
        return MaterialPageRoute(
            builder: (context) =>  BlocProvider(create: (_) => getIt<ChangePasswordViewModel>(),
                child: ChangePasswordScreen()));

      case AppRoutes.exams:
        final args = settings.arguments as ExamScreenArgs;
        return MaterialPageRoute(
          builder:
              (context) =>
                  ExamsScreen(subjectId: args.subjectId, subjectName: args.subjectName),
        );
      case AppRoutes.examsDetails:
        final examId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ExamDetailsScreen(examId: examId),
        );

      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}

class ExamScreenArgs {
  final String subjectId;
  final String subjectName;

  ExamScreenArgs({required this.subjectId, required this.subjectName});
}
