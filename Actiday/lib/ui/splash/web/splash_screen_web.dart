import 'package:actiday/ui/login/login_screen.dart';
import 'package:actiday/ui/splash/helper/common_image.dart';
import 'package:flutter/material.dart';

class SplashScreenWeb extends StatefulWidget {
  const SplashScreenWeb({super.key});

  @override
  State<SplashScreenWeb> createState() => _SplashScreenWebState();
}

class _SplashScreenWebState extends State<SplashScreenWeb> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CommonImage(imageHeight: 200, imageWidth: 200));
  }
}
