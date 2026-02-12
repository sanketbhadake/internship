import 'package:actiday/framework/controller/based%20controller/bottom_list.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/widgets/common_text.dart';




class BasedClassMobile extends StatefulWidget {
  const BasedClassMobile({super.key});

  @override
  State<BasedClassMobile> createState() => _BasedClassMobileState();
}

class _BasedClassMobileState extends State<BasedClassMobile> {
  final list = BottomList.bottomMenuList;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SvgPicture.asset(AppAssets.category),
        ),
        leadingWidth: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on),
            CommonText(text: "Abu Dhabi, UAE", fontSize: 12),
          ],
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(Icons.notifications_outlined),
        )],

      ),

      body: list[selectedIndex].screen,


      bottomNavigationBar: BottomNavigationBar(
        items: list.map((data) {
          int index = list.indexOf(data);
          return BottomNavigationBarItem(
            icon: Container(
              height: 30,
              width: 30,
              child: data.icon,
            ),
            label: data.name,
          );
        }).toList(),
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.black,
        elevation: 5,
        unselectedFontSize: 10,
        selectedFontSize: 12,
        backgroundColor: Colors.white,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
