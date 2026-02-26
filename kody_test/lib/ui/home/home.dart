import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'moible/home_mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return HomeMobile();
      },
    );
  }
}



