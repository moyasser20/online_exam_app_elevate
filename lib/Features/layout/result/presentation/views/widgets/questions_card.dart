import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import '../../../../../../core/theme/app_colors.dart';

class QuestionsCard extends StatelessWidget {
  const QuestionsCard({
    super.key,
  });

 
  @override
  Widget build(BuildContext context) {
    final int selectedAnswerIndex = 1;

    return Container(
      height: 350,
      width: 345,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black.withOpacity(0.01), // black border
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select the correctly punctuated\nsentence.",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Column(
              children: List.generate(4, (index) {
                return RadioListTile<int>(
                  value: index,
                  groupValue: selectedAnswerIndex,
                  onChanged: null,
                  title: const Text("its going to rain today"),
                  activeColor: AppColors.blue,
                  controlAffinity: ListTileControlAffinity.leading,
                  tileColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }),
            ),
          ],
        ).setHorizontalAndVerticalPadding(context, 0.03, 0.007),
      ),
    ).setVerticalPadding(context, 0.02);
  }
}
