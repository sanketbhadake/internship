import 'package:common_widgets/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class FavouriteMobile extends StatefulWidget {
  const FavouriteMobile({super.key});

  @override
  State<FavouriteMobile> createState() => FavouriteMobileState();
}

class FavouriteMobileState extends State<FavouriteMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CommonText(text: "Favourite")),
    );
  }
}
