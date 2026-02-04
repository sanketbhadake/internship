import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Scaffold Demo")),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.green,
                transform: Matrix4.rotationZ(0.2),
                // rotates the box
                child: Center(child: Text("Rotated")),
              ),
              Icon(Icons.star,semanticLabel: "Star"),

              Text("Hello, Flutter!"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add,),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text("Menu")),
              ListTile(title: Text("Item 1")),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
