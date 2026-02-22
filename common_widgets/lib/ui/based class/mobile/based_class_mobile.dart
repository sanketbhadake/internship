import 'package:common_widgets/framework/controller/based%20class/based_controller.dart';
import 'package:flutter/material.dart';

class BasedClassMobile extends StatefulWidget {
  const BasedClassMobile({super.key});

  @override
  State<BasedClassMobile> createState() => _BasedClassMobileState();
}

class _BasedClassMobileState extends State<BasedClassMobile> {
  final list = BasedController.bottomNavController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[ BasedController.currentIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        items: list.map((data) {
          return BottomNavigationBarItem(icon: data.widget, label: data.label);
        }).toList(),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            BasedController.currentIndex=index;
          });
        },
        currentIndex:  BasedController.currentIndex,
      ),
    );
  }
}
