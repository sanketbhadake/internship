import 'package:flutter/material.dart';

class UiFifth extends StatefulWidget {
  const UiFifth({super.key});

  @override
  State<UiFifth> createState() => _UiFifthState();
}

class _UiFifthState extends State<UiFifth> {
  List<Map<String, dynamic>> data = [
    {"icon": Icons.person, "name": "Personal Information"},
    {"icon": Icons.phone_android, "name": "Contact Details"},
    {"icon": Icons.location_on_rounded, "name": "Address Details"},
    {"icon": Icons.person, "name": "Kyc Details"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext, index) => Card(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            child: SizedBox(
              height: 45,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(data[index]['icon']),
                    Text(data[index]['name']),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
