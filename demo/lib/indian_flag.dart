import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: IndianFlag());
  }
}

class IndianFlag extends StatefulWidget {
  const IndianFlag({super.key});

  @override
  State<IndianFlag> createState() => IndianFlag_State();
}

class IndianFlag_State extends State<IndianFlag> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "Indian Flag",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Row(
        children: [
          SizedBox(width: 70),
          Flexible(
            child: Container(
              height: 600,
              width: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 90),
              Container(height: 50, width: 250, color: Colors.orange),
              Container(
                height: 50,
                width: 250,
                color: Colors.white,
                child: Image.network(
                  "https://static.vecteezy.com/system/resources/thumbnails/027/500/900/small/blue-ashok-chakra-wheel-symbol-in-flat-style-design-isolated-on-white-background-free-vector.jpg",
                ),
              ),
              Container(height: 50, width: 250, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
