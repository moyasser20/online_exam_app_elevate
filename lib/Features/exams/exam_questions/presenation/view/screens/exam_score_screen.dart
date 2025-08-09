import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import '../../../../../../core/Assets/app_assets.dart';
import '../../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../widgets/score_summery_widget.dart';

class ExamScoreScreen extends StatelessWidget {
  final int correctAnswer;
  final int totalQuestion;
  final String examId;
  final int examDuration;

  const ExamScoreScreen({
    super.key,
    required this.correctAnswer,
    required this.totalQuestion,
    required this.examId,
    required this.examDuration,
  });

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppAssets.ArrowIcon),
        ),
        title: Text(
          local.examScore,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
           Text(
            local.yourScore,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ).setHorizontalPadding(context, 0.05),
          const SizedBox(height: 30),
          ScoreSummary(correct: correctAnswer, total: totalQuestion),
          const SizedBox(height: 70),
          CustomElevatedButton(
            text: local.showResultButton,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.layout);
            },
            color: AppColors.blue,
            textColor: AppColors.white,
          ).setHorizontalPadding(context, 0.03),
          const SizedBox(height: 30),
          CustomElevatedButton(
            text: local.startExamAgainButton,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.questionsScreen,
                arguments: QuestionArgs(examId: examId, duration: examDuration),
              );
            },
            color: AppColors.white,
            textColor: AppColors.blue,
            borderColor: AppColors.blue,
          ).setHorizontalPadding(context, 0.03),
        ],
      ),
    );
  }
}
