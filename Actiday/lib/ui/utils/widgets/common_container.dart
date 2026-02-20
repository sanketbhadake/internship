import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderRadius;
  final Color? color;
  final Color? borderColor;
  final Widget? child;
  final bool? shadow;
  final bool? gradient;

  const CommonContainer({
    super.key,
    this.borderRadius = 0,
    this.color,
    this.child,
    this.borderColor,
    this.shadow=false,
    this.height,
    this.width,
    this.gradient=false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
        boxShadow:  shadow==true? [
          BoxShadow(
            spreadRadius: 0.3,
            color: Colors.grey,
            offset: Offset(0, 1),
            blurRadius: 7,
          )
        ]
          :[],
        gradient:gradient==true?
          LinearGradient(
          colors: [Color(0xffFEC34D), Color(0xffF88C83),Color(0xffF25CB2),Color(0xffF048C6),],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ):null
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
