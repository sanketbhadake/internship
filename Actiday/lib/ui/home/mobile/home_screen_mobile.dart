import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../framework/controller/home/home_model.dart';
import '../../utils/widgets/common_container.dart';
import '../../utils/widgets/common_size.dart';
import '../../utils/widgets/common_text.dart';
import '../../utils/widgets/common_textform.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  Welcome? welcome;

  @override
  void initState() {
    super.initState();
    loadBookingJson();
  }

  Future<void> loadBookingJson() async {
    final String response = await rootBundle.loadString(
      'assets/json/home.json',
    );

    final data = welcomeFromJson(response);

    setState(() {
      welcome = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextForm(
                hint: "yoga, pilates, massage",
                preFixIcon: Icon(Icons.search_sharp),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CommonContainer(
                      height: 160,
                      width: 335,
                      borderRadius: 13,
                      color: Colors.blue,
                      child: Image.network(
                        AppAssets.womenImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CommonText(text: "Active Lifestyle", fontSize: 16),
              CommonText(
                text: "Get active every day Try new things \nFind new classes",
                fontSize: 12,
              ),
              SizedBox(height: 20),
              CommonText(
                text: "Catagories",
                fontSize: 18,
                weight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  // CommonContainer(
                  //   height: 110,
                  //   width: context.screenWidth*0.4,
                  //   borderRadius: 13,
                  //   color: Colors.blue,
                  //   child: Row(
                  //     children: [
                  //       Expanded(child: CommonText(text: "Fitness", fontSize: 12)),
                  //       Image.asset("assets/images/fitness.png"),
                  //     ],
                  //   ),
                  // ),
                  // CommonContainer(
                  //   height: 110,
                  //   width: context.screenWidth*0.4,
                  //   borderRadius: 13,
                  //   color: Colors.blue,
                  //   child: Row(
                  //     children: [
                  //       CommonText(text: "Spa & Beauty", fontSize: 12),
                  //       Image.asset("assets/images/fitness.png"),
                  //     ],
                  //   ),
                  // ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: CommonContainer(
                          height: 110,
                          width: context.screenWidth * 0.4,
                          borderRadius: 13,
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 30,
                            ),
                            child: CommonText(
                              text: "Fitness",
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 22,
                        right: 20,
                        child: Image.asset("assets/images/fitness.png"),
                      ),
                    ],
                  ),

                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: CommonContainer(
                          height: 110,
                          width: context.screenWidth * 0.4,
                          borderRadius: 13,
                          color: AppColors.spaColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 30,
                            ),
                            child: CommonText(
                              text: "Spa & \nBeauty",
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 22,
                        right: 20,
                        child: Image.asset("assets/images/spa.png"),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CommonText(
                    text: "Top Classes",
                    weight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  Spacer(),
                  CommonText(
                    text: "See All",
                    fontSize: 16,
                    weight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: welcome?.topClass?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Stack(
                    children: [
                      CommonContainer(
                        height: 250,
                        width: context.screenWidth,
                        borderRadius: 13,
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png",
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 20,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        child: CommonContainer(
                          height: 120,
                          width: context.screenWidth,
                          color: Color(0xFFFFFFFF),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CommonText(
                                      text:
                                          welcome?.topClass?[index].title ??
                                          'NA',
                                      fontSize: 14,
                                      weight: FontWeight.bold,
                                    ),
                                    Spacer(),
                                    CommonText(
                                      text:
                                          welcome?.topClass?[index].rating
                                              .toString() ??
                                          'NA',
                                      fontSize: 14,
                                      weight: FontWeight.bold,
                                    ),
                                    SvgPicture.asset(
                                      "assets/svgs/star.svg",
                                      height: 18,
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                                CommonText(
                                  text:
                                      welcome?.topClass?[index].subTitle ??
                                      'NA',
                                  fontSize: 14,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, color: Colors.grey),
                                    CommonText(
                                      text:
                                          welcome?.topClass?[index].address ??
                                          'NA',
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
