import 'package:flutter/material.dart';

import '../../../../../core/Widgets/Custom_Elevated_Button.dart';
import '../../../../../core/theme/app_colors.dart';


class NavigationButtons extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onNext;
  final VoidCallback? onBack;

  const NavigationButtons({
    super.key,
    required this.isFirst,
    required this.isLast,
    this.onNext,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 180,
          height: 52,
          child: CustomElevatedButton(
            text: 'Back',
            onPressed: isFirst ? null : onBack,
            color: AppColors.white,
            textColor: AppColors.blue,
            borderRadius: 10,
            borderColor: AppColors.blue,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 180,
          height: 52,
          child: CustomElevatedButton(
            text: isLast ? 'Finish' : "Next",
            onPressed: onNext,
            color: AppColors.blue,
            textColor: AppColors.white,
            borderRadius: 10,
            borderColor: AppColors.blue,
          ),
        ),
      ],
    );
  }
}
