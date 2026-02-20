import 'package:flutter/material.dart';

import '../../based class/based_class.dart';
import '../../utils/widgets/common_container.dart';
import '../../utils/widgets/common_text.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({super.key});

  @override
  State<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BasedClass()),
          );
        },
        child: Center(
          child: CommonContainer(
            height: 60,
            width: 300,
            color: Colors.blue,
            borderRadius: 12,
            child: Center(
              child: CommonText(
                text: "Login",
                center: true,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
