import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xFFF9F9F9);
  static const Color grey = Color(0xFF535353);
  static const Color red = Color(0xFFCC1010);
  static const Color green = Color(0xFF11CE19);
  static const Color lightBlue = Color(0xFFEDEFF3);
  static const Color lightgreen = Color(0xFFCAF9CC);
  static const Color lightred = Color(0xFFF8D2D2);

  static MaterialColor blue = const MaterialColor(0xFF02369C, <int, Color>{
    10: Color(0xFFCCD7EB),
    20: Color(0xFFABBCDE),
    30: Color(0xFF809ACD),
    40: Color(0xFF5679BD),
    50: Color(0xFF2C58AC),
    0: Color(0xFF02369C),
    60: Color(0xFF022D82),
    70: Color(0xFF012468),
    80: Color(0xFF011B4E),
    90: Color(0xFF011234),
    100: Color(0xFF000B1F),
  });

  static MaterialColor black = const MaterialColor(0xFF0F0F0F, <int, Color>{
    10: Color(0xFFCFCFCF),
    20: Color(0xFFAFAFAF),
    30: Color(0xFF878787),
    40: Color(0xFF5F5F5F),
    50: Color(0xFF373737),
    0: Color(0xFF0F0F0F), // BASE
    60: Color(0xFF0D0D0D),
    70: Color(0xFF0A0A0A),
    80: Color(0xFF080808),
    90: Color(0xFF050505),
    100: Color(0xFF030303),
  });
}
