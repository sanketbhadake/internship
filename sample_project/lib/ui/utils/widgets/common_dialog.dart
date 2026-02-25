import 'package:flutter/material.dart';

class CommonDialogDialog {
  static Future<void> showConfirmDialog(
    BuildContext context, {
    required Widget body,

  }) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        actions: [
          body
        ],
      ),
    );
  }
}
