import 'package:doosy_customer/helper/common_layout.dart';
import 'package:flutter/material.dart';

import 'helper/custom_widget.dart';

class LocationSearch extends StatefulWidget {
  const LocationSearch({super.key});

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  @override
  Widget build(BuildContext context) {
    // final sizeHeight = MediaQuery.of(context).size.height;
    // final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTitle(text: "Search your location",onPress: (){
              Navigator.of(context).pop();
            },),
            Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: InputDecoration(border: InputBorder.none,
                prefixIcon: Icon(Icons.search_sharp),
                hintText: "Address Search"),

              ),
            ),
            Expanded(
              flex: 0,
              child: Row(
                children: [
                  Container(height: 1, width: 80, color: Colors.grey),
                  CustomText(text: "Or", fontSize: 16,color: Colors.grey,),
                  Container(height: 1, width: 80, color: Colors.grey),
                ],
              ),
            ),
            Row(
             children: [
               Image.asset("assets/maps.png"),
               CustomText(text: "Select Location via map", fontSize: 17)
             ],
            )

          ],
        ),
      ),

    );
  }
}
