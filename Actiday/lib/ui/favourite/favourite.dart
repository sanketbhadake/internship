import 'package:actiday/ui/favourite/mobile/favourite_mobile.dart';
import 'package:actiday/ui/favourite/web/favourite_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return const FavouriteMobile();
      },
      desktop: (BuildContext context) {
        return const FavouriteWeb();
      },
    );
  }
}
