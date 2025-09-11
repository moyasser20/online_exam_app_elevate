import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';


import '../../../../../../core/theme/app_colors.dart';

import 'build_score_circular_avatar.dart';

class ScoreSummary extends StatelessWidget {
  final int correct;
  final int total;

  const ScoreSummary({super.key, required this.correct, required this.total});

  @override
  Widget build(BuildContext context) {
    double percent = correct / total;
    int incorrect = total - correct;

    return Row(
      children: [
        CircularPercentIndicator(
          radius: 80,
          lineWidth: 10,
          percent: percent,
          animation: true,
          center: Text(
            "${(percent * 100).round()}%",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          progressColor: AppColors.blue,
          backgroundColor: AppColors.red,
          circularStrokeCap: CircularStrokeCap.round,
        ).setHorizontalPadding(context, 0.03),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildScoreCircularAvatar(
                title: 'Correct', value: correct, color: AppColors.blue),
            const SizedBox(height: 10),
            BuildScoreCircularAvatar(
                title: 'Incorrect', value: incorrect, color: AppColors.red),
          ],
        ),
      ],
    );
  }
}
