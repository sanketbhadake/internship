import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../framework/controller/based controller/bottom_list.dart';
import '../../login/login_screen.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/widgets/common_text.dart';
import '../based_class.dart';

class BasedClassWeb extends StatefulWidget {
  const BasedClassWeb({super.key});

  @override
  State<BasedClassWeb> createState() => _BasedClassWebState();
}

class _BasedClassWebState extends State<BasedClassWeb> {
  late int lastItem = BasedClass.selectIndex;

  void showAlertBoxModel() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: CommonContainer(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonText(text: "Are you sure to Logout", fontSize: 16),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CommonContainer(
                        height: 30,
                        width: 80,
                        borderRadius: 10,
                        borderColor:  Colors.black,

                        child: Center(
                          child: CommonText(
                            text: "NO",
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: CommonContainer(
                        height: 30,
                        width: 80,
                        borderRadius: 10,
                        color: Colors.red,
                        child: Center(
                          child: CommonText(
                            text: "YES",
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
                  BasedClass.selectIndex = data.id;
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
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    showAlertBoxModel();
                  },
                  child: Icon(Icons.logout_outlined),
                ),
              ],
            ),
          ),
        ],
        toolbarHeight: 70,

        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
      ),
      body:  menuList[BasedClass.selectIndex].screen,


      // CustomScrollView(
      //   slivers: [
      //     SliverList(
      //       delegate: SliverChildListDelegate([
      //         menuList[BasedClass.selectIndex].screen,
      //       ]),
      //     ),
      //     SliverFillRemaining(
      //       child: Align(
      //         alignment: Alignment.bottomCenter,
      //         child: CommonFooter(),
      //       ),
      //     ),
      //   ],
      // ),
      //
    );
  }
}
