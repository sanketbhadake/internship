import 'package:actiday/ui/based%20class/based_class.dart';
import 'package:actiday/ui/splash/helper/common_image.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenMobile extends StatefulWidget {
  const SplashScreenMobile({super.key});

  @override
  State<SplashScreenMobile> createState() => _SplashScreenMobileState();
}

class _SplashScreenMobileState extends State<SplashScreenMobile> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BasedClass()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CommonImage(imageHeight: 140, imageWidth: 140)
    );
  }
}
