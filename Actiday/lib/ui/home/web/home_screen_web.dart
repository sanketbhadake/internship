
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/theme/app_colors.dart';
import '../../../utils/widgets/common_text.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight=MediaQuery.of(context).size.height;
    final sizeWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: SvgPicture.asset("assets/svgs/logo black.svg", ),
        ),
        leadingWidth: 150,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CommonText(text: "Home", fontSize: 12),
            SizedBox(width: 15),
            CommonText(text: "Booking", fontSize: 12),
            SizedBox(width: 15),
            CommonText(text: "Explore", fontSize: 12),
            SizedBox(width: 15),
            CommonText(text: "Favourite", fontSize: 12),
          ],
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

    );
  }
}
