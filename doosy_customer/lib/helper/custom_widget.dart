import 'package:flutter/material.dart';
final slrcolor = Color(0xff00D9AE);
class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;

  const CustomButton({this.height, this.width, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      height: height ?? 50,
      width: width ?? sizeWidth,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 0.1,
            offset: Offset(0, 3),
            color: Colors.grey,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(0, 217, 174, 1),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  final String? labelText;

  const CustomTextForm({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(0, 217, 174, 1)),
          borderRadius: BorderRadius.circular(18),
        ),
        focusColor: const Color.fromRGBO(0, 217, 174, 1),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color? color;
  final bool isCenter;

  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.weight = FontWeight.normal,
    this.color,
    this.isCenter=false
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,textAlign: isCenter? TextAlign.center : TextAlign.start,
      style: TextStyle(fontWeight: weight, fontSize: fontSize, color: color),
    );
  }
}

class OtpBoxWidget extends StatelessWidget {
  const OtpBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(

        borderRadius: BorderRadiusGeometry.circular(10),
        // color: slrcolor,
        border: Border.all(
          color: slrcolor,
          width: 1,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none),
        textAlign: TextAlign.center,

      ),
    );
  }
}

