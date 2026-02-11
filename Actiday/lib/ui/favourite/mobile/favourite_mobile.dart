import 'package:flutter/material.dart';

import '../../../utils/widgets/common_text.dart';


class FavouriteMobile extends StatefulWidget {
  const FavouriteMobile({super.key});

  @override
  State<FavouriteMobile> createState() => _FavouriteMobileState();
}

class _FavouriteMobileState extends State<FavouriteMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CommonText(text: "Fav", fontSize: 15)),
    );
  }
}
