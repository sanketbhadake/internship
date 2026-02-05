import 'package:doosy_customer/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 1, width: 8, color: Colors.grey),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: CircleAvatar(
                    radius: 2,
                    backgroundColor: Color.fromRGBO(0, 217, 174, 1),
                  ),
                ),
                Container(height: 1, width: 8, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              "WELCOME",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 40),
            const Text(
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 50),

            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (builder) => const LoginScreen()));
              },
              child: Container(
                height: 50,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(0, 217, 174, 1),
                ),
                child: const Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (builder) => const RegisterScreen()));
              },
              child: Container(
                height: 50,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(214, 214, 214, 1),
                ),
                child: const Center(
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Guest user",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromRGBO(0, 217, 174, 1),
                  color: Color.fromRGBO(0, 217, 174, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
