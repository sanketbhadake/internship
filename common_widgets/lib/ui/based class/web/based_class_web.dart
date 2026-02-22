import 'package:common_widgets/framework/controller/based%20class/based_controller.dart';
import 'package:common_widgets/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class BasedClassWeb extends StatefulWidget {
  const BasedClassWeb({super.key});

  @override
  State<BasedClassWeb> createState() => _BasedClassWebState();
}

class _BasedClassWebState extends State<BasedClassWeb> {
  final item = BasedController.bottomNavController;
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: item.map((data) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  BasedController.currentIndex = data.id;
                });
              },
              child: CommonText(
                text: data.label,
                fontSize: (BasedController.currentIndex == data.id) ? 14 : 12,
                weight: (BasedController.currentIndex == data.id)
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            );
          }).toList(),
        ),
        centerTitle: true,
      ),
      body: BasedController.bottomNavController[BasedController.currentIndex].screen,
    );
  }
}
