import 'package:flutter/material.dart';

class AppSnackBar {

  static void success(BuildContext context, String message) {
    show(context, message: message, backgroundColor: Colors.green);
  }

  static void error(BuildContext context, String message) {
    show(context, message: message, backgroundColor: Colors.red);
  }

  static void show(
      BuildContext context, {
        required String message,
        required Color backgroundColor,
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}