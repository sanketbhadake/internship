import 'package:actiday/ui/splash/mobile/splash_screen_mobile.dart';
import 'package:actiday/ui/utils/widgets/common_footer.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../framework/controller/based controller/bottom_list.dart';
import '../../../based class/based_class.dart';
import '../../../splash/splash_screen.dart';
import '../../../utils/theme/app_colors.dart';
import '../../../utils/widgets/common_container.dart';

class BookingDetailWeb extends StatefulWidget {
  final bool upcoming;
  final bool? past;
  final int id;

  const BookingDetailWeb({
    super.key,
    this.upcoming = false,
    this.past,
    this.id = 0,
  });

  @override
  State<BookingDetailWeb> createState() => _BookingDetailWebState();
}

class _BookingDetailWebState extends State<BookingDetailWeb> {
  late int index = widget.id;

  late final item = widget.upcoming
      ? SplashScreenState.booking?.upcoming![index]
      : SplashScreenState.booking?.past![index];
  String ratingText = '';
  bool isClicked = false;
  int rateIndex = 0;

  @override
  Widget build(BuildContext context) {
    late int lastItem = BasedClass.selectIndex;
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
                    // showAlertBoxModel();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.of(context).pop();

                        },
                          child: SvgPicture.asset("assets/svgs/home.svg")),
                      Icon(Icons.arrow_forward_ios_outlined),
                      CommonText(text: "Booking", fontSize: 12),
                      Icon(Icons.arrow_forward_ios_outlined),
                      CommonText(text: "Booking Details ", fontSize: 12),
                    ],
                  ),
                  SizedBox(height: 20),
                  CommonText(
                    text: "Booking Details",
                    fontSize: 14,
                    weight: FontWeight.bold,
                  ),
                  // SizedBox(height: 20),
                  Row(
                    children: [
                      Stack(
                        children: [
                          CommonContainer(
                            // height: 250,
                            width: 800,
                            color: Color(0xffFCFCFC),
              
                            borderRadius: 16,
              
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                CommonContainer(
                                  height: 71,
                                  color: Color(0xffFCFCFC),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 90),
                                      Flexible(
                                        child: ListTile(
                                          title: CommonText(
                                            text: item?.title ?? '',
                                            fontSize: 14,
                                          ),
                                          subtitle: Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/svgs/svg_location.svg",
                                              ),
                                              CommonText(
                                                text: item?.address ?? '',
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                              SizedBox(width: 5),
                                              CommonText(text: '.', fontSize: 12),
                                              SizedBox(width: 5),
                                              CommonText(
                                                text: item?.rating.toString() ?? '',
                                                fontSize: 14,
                                              ),
                                              SizedBox(width: 5),
                                              Icon(Icons.star, size: 16),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Spacer(),
                                      CommonContainer(
                                        borderRadius: 14,
                                        height: 23,
                                        width: 75,
                                        borderColor: const Color(0xffF048C6),
                                        child: Center(
                                          child: CommonText(
                                            text: widget.upcoming
                                                ? "Book"
                                                : "continue",
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                CommonContainer(height: 34, child: Divider()),
              
                                CommonContainer(
                                  height: 142,
              
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 15,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CommonText(
                                              text: item?.category ?? '',
                                              fontSize: 12,
                                            ),
                                            Spacer(),
                                            CommonText(
                                              text: "${item?.credit} Credit",
                                              weight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.watch_later_outlined,
                                              size: 16,
                                              color: Color(0xff232323),
                                            ),
                                            SizedBox(width: 5),
                                            CommonText(
                                              text: item?.time ?? '',
              
                                              color: Color(0xff232323),
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
              
                                        Row(
                                          children: [
                                            CommonText(
                                              text: "Specialist",
                                              fontSize: 12,
                                            ),
                                            Spacer(),
                                            CommonText(
                                              text: item?.specialist ?? '',
                                              weight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
              
                                        Row(
                                          children: [
                                            CommonText(
                                              text: "Timeslot",
                                              fontSize: 12,
                                            ),
                                            Spacer(),
                                            CommonText(
                                              text: item?.timeSlot ?? '',
                                              weight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
              
                                        Row(
                                          children: [
                                            CommonText(
                                              text: "Booking ID",
                                              fontSize: 12,
                                            ),
                                            Spacer(),
                                            CommonText(
                                              text: item?.bookingId ?? '',
                                              weight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 15,
                            child: CommonContainer(
                              height: 85,
                              width: 85,
                              borderRadius: 13,
                              child: Image.asset(
                                "assets/images/booking_detail.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 40,),
                      Visibility(
                        visible: widget.past?? false,
                        child: CommonContainer(

                          color: Color(0xffFCFCFC),
                          borderRadius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CommonText(
                                  text: "Rate Us",
                                  weight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          rateIndex = 1;
              
                                        });
                                      },
                                      child: CommonContainer(
                                        height: 36,
                                        width: 44,
                                        borderColor: (rateIndex == 1)
                                            ? Colors.pink
                                            : Colors.grey,
                                        borderRadius: 13,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CommonText(text: '1', fontSize: 13,color: (rateIndex == 1)
                                                ? Colors.pink
                                                : Colors.grey,),
                                            (rateIndex == 1)
                                                ? SvgPicture.asset("assets/svgs/star.svg")
                                                : SvgPicture.asset("assets/svgs/grey_star.svg"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,
                                    ),
                                    CommonText(text: "Bad", fontSize: 14,color: (rateIndex == 1)
                                        ? Colors.pink
                                        : Colors.grey,)
                                  ],
                                ),
                                SizedBox(height: 10,),
              
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          rateIndex = 2;
              
                                        });
                                      },
                                      child: CommonContainer(
                                        height: 36,
                                        width: 44,
                                        borderColor: (rateIndex == 2)
                                            ? Colors.pink
                                            : Colors.grey,
                                        borderRadius: 13,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CommonText(text: '2', fontSize: 13,color: (rateIndex == 2)
                                                ? Colors.pink
                                                : Colors.grey,),
                                            (rateIndex == 2)
                                                ? SvgPicture.asset("assets/svgs/star.svg")
                                                : SvgPicture.asset("assets/svgs/grey_star.svg"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,
                                    ),
                                    CommonText(text: "Better", fontSize: 14,color: (rateIndex == 2)
                                        ? Colors.pink
                                        : Colors.grey,)
                                  ],
                                ),
                                SizedBox(height: 10,),
              
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          rateIndex = 3;
              
                                        });
                                      },
                                      child: CommonContainer(
                                        height: 36,
                                        width: 44,
                                        borderColor: (rateIndex == 3)
                                            ? Colors.pink
                                            : Colors.grey,
                                        borderRadius: 13,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CommonText(text: '3', fontSize: 13,color: (rateIndex == 3)
                                                ? Colors.pink
                                                : Colors.grey,),
                                            (rateIndex == 3)
                                                ? SvgPicture.asset("assets/svgs/star.svg")
                                                : SvgPicture.asset("assets/svgs/grey_star.svg"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,
                                    ),
                                    CommonText(text: "Good", fontSize: 14,color: (rateIndex == 3)
                                        ? Colors.pink
                                        : Colors.grey,)
                                  ],
                                ),
                                SizedBox(height: 10,),
              
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          rateIndex = 4;
              
                                        });
                                      },
                                      child: CommonContainer(
                                        height: 36,
                                        width: 44,
                                        borderColor: (rateIndex == 4)
                                            ? Colors.pink
                                            : Colors.grey,
                                        borderRadius: 13,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CommonText(text: '4', fontSize: 13,color: (rateIndex == 4)
                                                ? Colors.pink
                                                : Colors.grey,),
                                            (rateIndex == 4)
                                                ? SvgPicture.asset("assets/svgs/star.svg")
                                           : SvgPicture.asset("assets/svgs/grey_star.svg"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,
                                    ),
                                    CommonText(text: "Very Good", fontSize: 14,color: (rateIndex == 4)
                                        ? Colors.pink
                                        : Colors.grey,)
                                  ],
                                ),
                            SizedBox(height: 10,),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          rateIndex = 5;
              
                                        });
                                      },
                                      child: CommonContainer(
                                        height: 36,
                                        width: 44,
                                        borderColor: (rateIndex == 5)
                                            ? Colors.pink
                                            : Colors.grey,
                                        borderRadius: 13,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CommonText(text: '5', fontSize: 13,color: (rateIndex == 5)
                                                ? Colors.pink
                                                : Colors.grey,),
                                            (rateIndex == 5)
                                                ? SvgPicture.asset("assets/svgs/star.svg")
                                                : SvgPicture.asset("assets/svgs/grey_star.svg"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,
                                    ),
                                    CommonText(text: "Excellent", fontSize: 12,color: (rateIndex == 5)
                                        ? Colors.pink
                                        : Colors.grey,)
                                  ],
                                ),
              
              
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CommonText(
                    text: "Payment Summary",
                    weight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  SizedBox(height: 20),
                  CommonContainer(
                    height: 95,
                    width: 800,
                    color: Color(0xffFCFCFC),
                    borderRadius: 13,
              
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CommonText(text: "Booking", fontSize: 12),
                              Spacer(),
                              CommonText(
                                text: "${item?.credit} Credit",
                                weight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Divider(),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              CommonText(text: "Order Total", fontSize: 12),
                              Spacer(),
                              CommonText(
                                text: "${item?.credit} Credit",
                                weight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CommonContainer(
                    height: 70,
                    width: 800,
                    color: Color(0xffFCFCFC),
                    borderRadius: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 15,
                      ),
                      child: CommonText(
                        text:
                            "You can cancel an appointment minimum of 30 minutes prior to the scheduled time.",
                        fontSize: 14,

                        color: Color(0xff576464),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Visibility(
                    visible: widget.past ?? false,
                    child: CommonContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              
                          CommonText(
                            text: "Write Your Reviews",
                            weight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          SizedBox(height: 20),
                          CommonContainer(
                            width: 800,
                            borderRadius: 30,
                            color: Color(0xffFCFCFC),
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hint: CommonText(
                                    text:
                                        "Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry's Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took A Galley Of Type And Scrambled It To Make A Type Specimen Book.",
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              
                  SizedBox(height: 20),
                  Visibility(
                    visible: widget.upcoming,
                    child: CommonContainer(
                      height: 50,
                      width: 212,
                      borderRadius: 25,
                      borderColor: Color(0xff3A4161),
                      child: Center(
                        child: CommonText(text: "Cancel Booking", fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Visibility(
                    visible: widget.past ?? false,
                    child: CommonContainer(
                      height: 55,
                      width: 212,
                      borderRadius: 25,
                      gradient: true,
                      child: Center(
                        child: CommonText(
                          text: "Submit",
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            CommonFooter()
          ],
        ),
      ),
    );
  }
}
