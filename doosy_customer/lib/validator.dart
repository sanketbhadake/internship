import 'dart:developer';

import 'package:flutter/material.dart';

class Validator extends StatefulWidget {
  const Validator({super.key});

  @override
  State<Validator> createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailcontroller,

                    decoration: InputDecoration(
                      labelText: "Email",

                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Filed is empty";
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Pass",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "pass is empty";
                      }
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return "Pass must be contain digit";
                      }
                      return null;
                    },
                  ),

                  ElevatedButton(
                    onPressed: () {
                      email = _emailcontroller.toString().trim();
                      pass = _passwordcontroller.toString().trim();

                      if (_globalKey.currentState!.validate()) {
                        setState(() {
                          log(
                            "Email : ${_emailcontroller.toString().trim()};");
                          log("Pass : ${pass.toString().trim()}");
                          log("Login Successfully");
                          _emailcontroller.clear();
                          _passwordcontroller.clear();
                        });
                      }
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
