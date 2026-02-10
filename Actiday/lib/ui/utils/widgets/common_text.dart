import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double fontSize;

  const CommonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.bold,

    ),);
  }
}
