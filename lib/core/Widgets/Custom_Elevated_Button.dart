import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  const CustomElevatedButton({super.key, required this.text, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 373,
      height: 52,
      child: ElevatedButton(onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppColors.blue,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            )
          ),
          child: Text(text, style: const TextStyle(
            color: AppColors.white
          ),)
      ),
    );
  }
}
