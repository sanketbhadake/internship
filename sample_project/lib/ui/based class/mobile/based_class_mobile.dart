import 'package:flutter/material.dart';
import 'package:sample_project/freamwork/controller/based%20class/based_controller.dart';


class BasedClassMobile extends StatefulWidget {
  const BasedClassMobile({super.key});

  @override
  State<BasedClassMobile> createState() => _BasedClassMobileState();
}

class _BasedClassMobileState extends State<BasedClassMobile> {
  final item = BasedController.navigation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BasedController.navigation[BasedController.currentIndex].screen,

      bottomNavigationBar: BottomNavigationBar(
        items: item.map((data) {
          return BottomNavigationBarItem(icon: data.icon, label: data.label);
        }).toList(),
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            BasedController.currentIndex=index;
          });

        },
        currentIndex:  BasedController.currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
      ),
    );
  }
}
