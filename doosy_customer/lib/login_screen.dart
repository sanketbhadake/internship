import 'package:flutter/material.dart';

import 'bottom_nav.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Log In",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color.fromRGBO(0, 217, 174, 1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color.fromRGBO(0, 217, 174, 1)),
                ),
                labelText: 'Phone',
                labelStyle: const TextStyle(color: Colors.grey),
                focusColor: const Color.fromRGBO(0, 217, 174, 1),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Click Here for email Log In",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (builder) => const BottomNav()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(0, 217, 174, 1),
                ),
                child: const Center(
                  child: Text(
                    "LOG IN",
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
            const Align(
              child: Text(
                "Or Log In using social media",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 0.7,
                        offset: Offset(0, 2),
                        color: Colors.grey,
                      ),
                    ],
                    color: const Color.fromRGBO(0, 127, 255, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/facebook.png"),
                      const SizedBox(width: 5),
                      const Text("Facebook", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 0.7,
                        offset: Offset(0, 2),
                        color: Colors.grey,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/google-icon.png"),
                      const SizedBox(width: 5),
                      const Text(
                        "Google",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Center(
              child: TextButton(
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
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          decorationColor: Colors.grey,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                          decorationColor: Color.fromRGBO(0, 217, 174, 1),
                          color: Color.fromRGBO(0, 217, 174, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
