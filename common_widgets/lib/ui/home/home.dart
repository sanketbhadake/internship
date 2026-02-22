import 'package:common_widgets/ui/home/mobile/home_mobile.dart';
import 'package:common_widgets/ui/home/web/home_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context){
        return HomeMobile();
      },
      desktop: (BuildContext context){
        return HomeWeb();
      },
    );
  }
}
