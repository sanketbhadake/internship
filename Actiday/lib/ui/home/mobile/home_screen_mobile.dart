import 'package:actiday/utils/widgets/common_text.dart';
import 'package:actiday/utils/widgets/custom_textform.dart';

import 'package:flutter/material.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextForm(
              hint: "yoga, pilates, massage",
              preFixIcon: Icon(Icons.search_sharp),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 150,
                  width: 335,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(13),
                   color: Colors.blue
                 ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CommonText(text: "Active Lifestyle", fontSize: 16),
            CommonText(text: "Get active every day Try new things Find new classes", fontSize: 12),
            SizedBox(
              height: 20,
            ),
            CommonText(text: "Catagories", fontSize: 16)
          ],
        ),
      ),
    );
  }
}
