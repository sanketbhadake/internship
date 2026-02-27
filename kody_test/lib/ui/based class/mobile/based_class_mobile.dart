import 'package:flutter/material.dart';
import 'package:kody_test/freamwork/controller/based_controller.dart';

class BasedClassMobile extends StatefulWidget {
  const BasedClassMobile({super.key});

  @override
  State<BasedClassMobile> createState() => _BasedClassMobileState();
}

class _BasedClassMobileState extends State<BasedClassMobile> {
  final item = BasedController.navigation;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
