import 'package:flutter/material.dart';
import 'package:sample_project/freamwork/controller/based%20class/based_controller.dart';
import 'package:sample_project/ui/utils/widgets/common_text.dart';

class BasedClassWeb extends StatefulWidget {
  const BasedClassWeb({super.key});

  @override
  State<BasedClassWeb> createState() => _BasedClassWebState();
}

class _BasedClassWebState extends State<BasedClassWeb> {
  final items = BasedController.navigation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: items.map((data) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  BasedController.currentIndex = data.id;
                });
              },
              child: CommonText(
                text: data.label,
                fontSize: (data.id == BasedController.currentIndex) ? 14 : 12,
                weight: (data.id == BasedController.currentIndex)
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            );
          }).toList(),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: BasedController.navigation[BasedController.currentIndex].screen,
    );
  }
}
