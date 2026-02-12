import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../framework/controller/based controller/bottom_list.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/widgets/common_text.dart';

class BasedClassWeb extends StatefulWidget {
  const BasedClassWeb({super.key});

  @override
  State<BasedClassWeb> createState() => _BasedClassWebState();
}

class _BasedClassWebState extends State<BasedClassWeb> {
  late int lastItem = 0;
  late int selectIndex = 0;

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
                  BottomList.bottomMenuList[lastItem].isSelect = false;
                  data.isSelect = true;
                  selectIndex = data.id;
                });
                lastItem = data.id;
              },
              child: CommonText(
                text: data.name,
                fontSize: data.isSelect ? 14 : 12,
                weight: data.isSelect ? FontWeight.bold : FontWeight.normal,
              ),
            );
          }).toList(),
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
                CircleAvatar(
                  radius: 20,

                  backgroundColor: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset("assets/images/profile.png"),
                  ),
                ),
              ],
            ),
          ),
        ],

        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
      ),
      body: menuList[selectIndex].screen,
    );
  }
}
