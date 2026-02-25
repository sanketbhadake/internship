
import 'package:actiday/ui/utils/widgets/Common%20Widgets/common_text.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final Color? txtColor;
  final double? height;
  final double? width;
  final double? borderRadius;

  const CommonButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.txtColor,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
        onPressed: onTap,
        child: CommonText(text:title ,color: txtColor,)
      ),
    );
  }
}
