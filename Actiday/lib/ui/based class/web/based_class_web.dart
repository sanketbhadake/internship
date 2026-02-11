import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../framework/controller/based controller/bottom_list.dart';
import '../../../utils/theme/app_colors.dart';
import '../../../utils/widgets/common_text.dart';

class BasedClassWeb extends StatefulWidget {
  const BasedClassWeb({super.key});

  @override
  State<BasedClassWeb> createState() => _BasedClassWebState();
}

class _BasedClassWebState extends State<BasedClassWeb> {
  late int lastItem=0;
  @override
  Widget build(BuildContext context) {
    final menuList = BottomList.bottomMenuList;

    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: SvgPicture.asset("assets/svgs/logo black.svg"),
        ),
        leadingWidth: 160,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,

          children: BottomList.bottomMenuList.map((data) {
            return InkWell(
              onTap: () {
                setState(() {

                  BottomList.bottomMenuList[lastItem].isSelect=false;
                  data.isSelect=true;

                });
                lastItem=data.id;


              },
              child:
              CommonText(
                text: data.name,
                fontSize: data.isSelect ? 14 : 12,
                weight: data.isSelect ? FontWeight.bold : FontWeight.normal,
              ),
            );
          }).toList(),
          // [
          //   CommonText(text: "Home", fontSize: 14),
          //   SizedBox(width: 15),
          //   CommonText(text: "Booking", fontSize: 14),
          //   SizedBox(width: 15),
          //   CommonText(text: "Explore", fontSize: 14),
          //   SizedBox(width: 15),
          //   CommonText(text: "Favourite", fontSize: 14),
          // ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 80.0),
            child: Row(
              children: [
                Icon(Icons.search_sharp),
                SizedBox(width: 15),
                Icon(Icons.notifications_outlined),
                SizedBox(width: 15),
                CircleAvatar(radius: 15, backgroundColor: Colors.red),
              ],
            ),
          ),
        ],

        backgroundColor: appBarColor,
        centerTitle: true,
      ),

      //   Container(
      //   height: 170,
      //   width: sizeWidth,
      //   color: Colors.black,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       CommonText(text: "copyright © 2020-22 Dreamplug Technologies Pvt Ltd.", fontSize: 12,color: Colors.white,),
      //       CommonText(text: "privacy policy | terms and conditions | returns and refund", fontSize: 12,color: Colors.white,),
      //     ],
      //   ),
      // ),
    );
  }
}
