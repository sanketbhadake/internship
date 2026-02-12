import 'package:actiday/ui/splash/mobile/splash_screen_mobile.dart';
import 'package:actiday/ui/splash/web/splash_screen_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return SplashScreenMobile();
      },
      desktop: (BuildContext context) {
        return SplashScreenWeb();
      },
    );
  }
}
