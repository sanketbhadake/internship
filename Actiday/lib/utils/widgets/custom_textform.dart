import 'package:flutter/material.dart';
import 'common_text.dart';

class CustomTextForm extends StatelessWidget {
  final String hint ;
  final Widget? sufixIcon;
  final Widget? preFixIcon;
  const CustomTextForm( {super.key,required this.hint, this.sufixIcon,this.preFixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        hint: CommonText(text: hint, fontSize: 11),
        prefixIcon: preFixIcon,
        suffix: sufixIcon,

        focusColor: Color(0xffCCCCCC),
        fillColor: Color(0xffCCCCCC),
      ),
    );
  }
}
