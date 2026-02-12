import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonImage extends StatefulWidget {
  final double? imageHeight;
  final double? imageWidth;
  const CommonImage({super.key,   this.imageHeight,   this.imageWidth});

  @override
  State<CommonImage> createState() => _CommonImageState();
}

class _CommonImageState extends State<CommonImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(AppAssets.splashLogo, height: widget.imageHeight, width: widget.imageWidth),
    );
  }
}
