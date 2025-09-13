// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// extension FormatPoints on String {
//
//   String formatPoints(BuildContext context) {
//     int length = this.length;
//     String value = this;
//     int counter = 1;
//     while (counter * 3 < length) {
//       value = value.substring(0, length - counter * 3) +
//           ',' +
//           value.substring(length - counter * 3, (length + counter - 1));
//       counter += 1;
//     }
//     return value;
//   }
//
//   String formatDecimalAndThousandPoints(BuildContext context, {int currencyMinorUnit = 0}) {
//
//     String value = this;
//
//     NumberFormat formatter = NumberFormat('###0.00');
//
//     var division = "1";
//     for(int i=0; i<currencyMinorUnit; i++) {
//       division += "0";
//     }
//     value = (int.parse(value)/ double.parse(division)).toString();
//     double newFormatter = double.parse(value);
//     value = formatter.format(newFormatter);
//
//     return value;
//   }
//
// }
