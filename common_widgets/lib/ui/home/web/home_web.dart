import 'package:common_widgets/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';


class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => HomeWebState();
}

class HomeWebState extends State<HomeWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CommonText(text: "Home")),
    );
  }
}
