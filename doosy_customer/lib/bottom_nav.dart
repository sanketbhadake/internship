import 'package:flutter/material.dart';

import 'home_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> menu = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  int _selectIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.window_outlined),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_rounded),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
        ],
        currentIndex: _selectIndex,
        onTap: (index){
          _selectIndex=index;
        },
      ),
    );
  }
}
