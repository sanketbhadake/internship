
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? weight;

  const CommonText({super.key, required this.text, required this.fontSize, this.color,this.weight});

  @override
  Widget build(BuildContext context) {

    return Text(text,style: GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: weight?? FontWeight.w500,
      color:  color?? Colors.black
    ),);
  }
}
