import 'package:actiday/ui/home/mobile/home_screen_mobile.dart';
import 'package:actiday/ui/home/web/home_screen_web.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return HomeScreenMobile();
      },
      desktop: (BuildContext context) {
        return HomeScreenWeb();
      },
    );
  }
}
