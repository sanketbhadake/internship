import 'package:flutter/material.dart';


class CommonText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? weight;
  final bool center;

  const CommonText({
    super.key,
    required this.text,
    required this.fontSize,
    this.center = false,
    this.color,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: center ? TextAlign.center : TextAlign.start,
      style:
          TextStyle(
            fontFamily: 'Roboto',
            fontSize: fontSize,
              fontWeight: weight ?? FontWeight.w500,
              color: color ?? Colors.black,

          )



    );
  }
}
