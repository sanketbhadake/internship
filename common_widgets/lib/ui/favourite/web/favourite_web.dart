import 'package:common_widgets/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class FavouriteWeb extends StatefulWidget {
  const FavouriteWeb({super.key});

  @override
  State<FavouriteWeb> createState() => FavouriteWebState();
}

class FavouriteWebState extends State<FavouriteWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CommonText(text: "Favourite")),
    );
  }
}
