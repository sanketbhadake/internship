import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeController);

    return Scaffold(
      body: InkWell(
        onTap: controller.toggle,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: controller.isRed ? Colors.red : Colors.blue,
          child: Center(child: Text("Click to change color to ${controller.isRed ? "blue" : "red"}")),
        ),
      ),
    );
  }
}