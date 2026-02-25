import 'package:flutter/material.dart';
import 'package:sample_project/ui/utils/widgets/common_text.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonText(text: "IN ORDERS"),
    );
  }
}
