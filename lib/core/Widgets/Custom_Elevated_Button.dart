import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;              // Background color
  final Color? textColor;          // Text color
  final Color? borderColor;        // Outline/border color
  final double borderRadius;       // Border radius

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderColor,
    this.borderRadius = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 373,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.blue,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1.5,
            ),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
