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
import '../../Features/layout/result/presentation/views/screens/answer_screen.dart';
import '../../Features/layout/result/presentation/views/screens/answers_loader_screen.dart';
import '../../Features/exams/domain/entity/question_entity.dart';
import '../../Features/layout/result/presentation/views/screens/result_screen.dart';
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
        final args = settings.arguments as QuestionArgs;
        return MaterialPageRoute(
          builder:
              (context) => QuestionScreen(
                examId: args.examId,
                examDuration: args.duration,
              ),
        );

      case AppRoutes.examScoreScreen:
        final args = settings.arguments as ExamScoreArgs;
        return MaterialPageRoute(
          builder:
              (context) => ExamScoreScreen(
                correctAnswer: args.correctAnswer,
                totalQuestion: args.totalQuestion,
                examId: args.examId,
                examDuration: args.duration,
              ),
        );

      case AppRoutes.layout:
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
      case AppRoutes.changePassword:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (_) => getIt<ChangePasswordViewModel>(),
                child: const ChangePasswordScreen(),
              ),
        );

      case AppRoutes.exams:
        final args = settings.arguments as ExamScreenArgs;
        return MaterialPageRoute(
          builder:
              (context) => ExamsScreen(
                subjectId: args.subjectId,
                subjectName: args.subjectName,
              ),
        );
      case AppRoutes.examsDetails:
        final examId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ExamDetailsScreen(examId: examId),
        );
      case AppRoutes.answersScreen:
        final args = settings.arguments;
        if (args is AnswersArgs) {
          return MaterialPageRoute(
            builder:
                (context) => AnswersScreen(
                  questions: args.questions,
                  selectedAnswers: args.selectedAnswers,
                ),
          );
        } else if (args is AnswersHistoryArgs) {
          return MaterialPageRoute(
            builder:
                (context) => AnswersLoaderScreen(
                  examId: args.examId,
                  selectedAnswers: args.selectedAnswers,
                ),
          );
        }
        return MaterialPageRoute(builder: (context) => const AnswersScreen());
      case AppRoutes.result:
        return MaterialPageRoute(builder: (context) => const ResultScreen());
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

class ExamScoreArgs {
  final int correctAnswer;
  final int totalQuestion;
  final String examId;
  final int duration;

  ExamScoreArgs({
    required this.correctAnswer,
    required this.totalQuestion,
    required this.examId,
    required this.duration,
  });
}

class QuestionArgs {
  final String examId;
  final int duration;

  QuestionArgs({required this.examId, required this.duration});
}

class AnswersArgs {
  final List<QuestionEntity> questions;
  final List<String?> selectedAnswers;

  AnswersArgs({required this.questions, required this.selectedAnswers});
}

class AnswersHistoryArgs {
  final String examId;
  final List<String?> selectedAnswers;
  AnswersHistoryArgs({required this.examId, required this.selectedAnswers});
}
