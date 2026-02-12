import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class CommonListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final double fontSize;

  const CommonListTile({super.key, required this.title, required this.subTitle, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CommonText(text: title, fontSize: fontSize),
      subtitle:  CommonText(text: title, fontSize: fontSize),

    );
  }
}
