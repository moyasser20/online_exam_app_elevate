import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BuildScoreCircularAvatar extends StatelessWidget {
  final String title;
  final int value;
  final Color color;

  const BuildScoreCircularAvatar({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(title, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: color
        ),
        ),
        const SizedBox(width: 50,),
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 1.5),
            color: Colors.transparent
          ),
          child:Text(value.toString(), style: TextStyle(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.w500
          ),),
        )
      ],
    );
  }
}
