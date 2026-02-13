import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderRadius;
  final Color? color;
  final Widget? child;


  const CommonContainer({
    super.key,
    this.borderRadius=0,
    this.color,
    this.child,

      this.height,
      this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
