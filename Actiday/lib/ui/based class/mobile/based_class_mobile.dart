import 'package:actiday/framework/controller/based%20controller/bottom_list.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/widgets/common_text.dart';
import '../based_class.dart';




class BasedClassMobile extends StatefulWidget {
  const BasedClassMobile({super.key});

  @override
  State<BasedClassMobile> createState() => _BasedClassMobileState();
}

class _BasedClassMobileState extends State<BasedClassMobile> {
  final list = BottomList.bottomMenuList;


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: list[BasedClass.selectIndex].screen,


      bottomNavigationBar: BottomNavigationBar(
        items: list.map((data) {
          int index = list.indexOf(data);
          return BottomNavigationBarItem(
            icon: CommonContainer(
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
            BasedClass.selectIndex = index;
          });
        },
        currentIndex: BasedClass.selectIndex,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
