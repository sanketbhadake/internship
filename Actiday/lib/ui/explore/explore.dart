import 'package:actiday/ui/explore/mobile/explore_mobile.dart';
import 'package:actiday/ui/explore/web/explore_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return ExploreMobile();
      },
      desktop: (BuildContext context) {
        return ExploreWeb();
      },
    );
  }
}
