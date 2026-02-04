import 'package:flutter/material.dart';
import 'package:pratice_ui/third_ui.dart';
import 'package:pratice_ui/ui_fifth.dart';
import 'package:pratice_ui/ui_six.dart';
import 'package:pratice_ui/ui_two.dart';

class UiOne extends StatefulWidget {
  const UiOne({super.key});

  @override
  State<UiOne> createState() => _UiOneState();
}

class _UiOneState extends State<UiOne> {
  void _pressAlertBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Timing Details",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    Icon(Icons.cancel),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text("Clock In"),
                            Spacer(),
                            Text("10:00 PM"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Active hours"),
                            Spacer(),
                            Text("10:00 PM"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Active hours"),
                            Spacer(),
                            Text("02:00 PM- 4:00PM"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Active hours"),
                            Spacer(),
                            Text("02:00 PM- 4:00PM"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Clock out"),
                            Spacer(),
                            Text("7:30PM"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Work Time",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text("9 Hours 8 Minutes"),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.work),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onPress() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actions: [
          Column(
            children: [
              Image.asset("assets/celebration.png"),
              SizedBox(height: 5),
              Text(
                "Password changed successfully",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Align(
                child: Text(
                  "Your desired password has been changed provide login needs for further experience",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter UI practice"),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: _onPress,
                child: Text("First UI", style: TextStyle(color: Colors.white)),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => UiTwo()));
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Second UI",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => ThirdUi()));
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Third UI",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: _pressAlertBox,
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Fourth UI",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => UiFifth()));
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "fifth UI",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => UiSix()));
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("SIx UI", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
