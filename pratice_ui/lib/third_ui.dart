import 'package:flutter/material.dart';

class ThirdUi extends StatefulWidget {
  const ThirdUi({super.key});

  @override
  State<ThirdUi> createState() => _ThirdUiState();
}

class _ThirdUiState extends State<ThirdUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notification"),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                Spacer(),
                Text(
                  "Clear All",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            // Expanded(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: 3,
            //     itemBuilder: (context, index) => Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Container(
            //           height: 90,
            //           width: MediaQuery.of(context).size.width,
            //           color: Colors.red,
            //           child: Row(
            //             children: [
            //
            //               Text("Order Confirmed"),
            //               // Spacer(),
            //               // Text("1 hr ago"),
            //               //
            //               // Image.asset("assets/bell.png"),
            //               // Text(
            //               //   "Our order for 24k gold bar has been confirmed.delivery details share soon",
            //               // ),
            //             ],
            //           ),
            //         ),
            //         SizedBox(
            //           height: 10,
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            SizedBox(
              height: 80,
            ),
            Container(
              child: Column(
                children: [
                  Image.asset("assets/notification.png",scale: 9,),
                  Text("No Notification Found",style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
