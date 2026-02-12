import 'package:flutter/material.dart';


import '../../utils/widgets/common_text.dart';



class ExploreMobile extends StatefulWidget {
  const ExploreMobile({super.key});

  @override
  State<ExploreMobile> createState() => _ExploreMobileState();
}

class _ExploreMobileState extends State<ExploreMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CommonText(text: "Explore", fontSize: 15)),
    );
  }
}
