import 'package:flutter/widgets.dart';

extension BorderToWidget on Widget {
  Widget setBottomBorder(BuildContext context, double width, Color color) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: color, width: width)),
      ),
      child: this,
    );
  }
}
