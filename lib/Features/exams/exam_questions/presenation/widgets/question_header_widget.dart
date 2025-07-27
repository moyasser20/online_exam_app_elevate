import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';


class QuestionHeader extends StatelessWidget {
  final int currentPage;
  final int totalQuestions;

  const QuestionHeader({
    super.key,
    required this.currentPage,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Questions ${currentPage + 1} to $totalQuestions",
            style: const TextStyle(fontSize: 16),
          ),
        ),
        LinearProgressIndicator(
          value: (currentPage + 1) / totalQuestions,
          color: AppColors.blue,
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
