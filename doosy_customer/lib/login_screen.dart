import 'package:doosy_customer/helper/common_layout.dart';
import 'package:doosy_customer/helper/custom_widget.dart';
import 'package:flutter/material.dart';

import 'bottom_nav.dart';
import 'forgot_pass_verification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  void openBottomSheet() {
    showModalBottomSheet(
      elevation: 1,
      isScrollControlled: true,

      context: context,
      builder: (builder) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: CustomText(
                      text: "Forgot Password",
                      fontSize: 19,
                      weight: FontWeight.w600,
                    ),
                    subtitle: CustomText(
                      text:
                          "Please enter your registered Phone Number/Email to receive password reset link",
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),

                  CustomTextForm(labelText: 'Enter Email/Phone'),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgotPassVerification(),
                        ),
                      );
                    },
                    child: CustomButton(text: "SUBMIT"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTitle(
                text: "Log In",
                onPress: () {
                  Navigator.of(context).pop();
                },
              ),

              const SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 217, 174, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 217, 174, 1),
                    ),
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
                    onPressed: openBottomSheet,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => const BottomNav()),
                  );
                },
                child: CustomButton(text: "LOGIN"),
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
                        const Text(
                          "Facebook",
                          style: TextStyle(color: Colors.white),
                        ),
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
      ),
    );
  }
}
