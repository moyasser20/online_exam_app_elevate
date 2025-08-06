import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/Assets/app_assets.dart';
import 'package:online_exam_app_elevate/core/Widgets/Custom_Elevated_Button.dart';
import 'package:online_exam_app_elevate/core/routes/app_routes.dart';

import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/theme/app_colors.dart';

class TimeoutDialog extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final String examId;
  final int examDuration;
  const TimeoutDialog({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.examId,
    required this.examDuration,
  });

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.symmetric(vertical: 45, horizontal: 32),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.hourGlassImage, height: 60),
              const SizedBox(width: 20),
              Text(
                local.timeoutMsg,
                style: const TextStyle(
                  color: AppColors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          CustomElevatedButton(
            text: local.viewScoreButton,
            onPressed: () {
              Navigator.of(context).popAndPushNamed(
                AppRoutes.examScoreScreen,
                arguments: ExamScoreArgs(
                  correctAnswer: correctAnswers,
                  totalQuestion: totalQuestions,
                  examId: examId,
                  duration: examDuration,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
