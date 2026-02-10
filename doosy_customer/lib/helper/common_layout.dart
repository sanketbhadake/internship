import 'package:doosy_customer/helper/custom_widget.dart';
import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final GestureTapCallback? onPress;

  const CommonTitle({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onPress,
          child: Ink(child: Icon(Icons.arrow_back_ios)),
        ),
        SizedBox(height: 20),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: 20,
        ),

      ],
    );
  }
}
