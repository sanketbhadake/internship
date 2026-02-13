import 'package:actiday/framework/controller/favourite/favourite_controller.dart';
import 'package:actiday/framework/repository/favourite/favourite_model.dart';
import 'package:actiday/framework/repository/home/home_model.dart';
import 'package:actiday/ui/home/helper/common_card.dart';
import 'package:actiday/ui/home/helper/common_carousel.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  bool isLike = false;
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
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

              CommonCarousel(showIndicator: false),
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

              SizedBox(
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: welcome?.categories?.length ?? 0,

                  itemBuilder: (context, index) => Row(
                    children: [
                      Stack(
                        children: [
                          CommonContainer(
                            height: 110,
                            width: context.screenWidth * 0.4,
                            borderRadius: 13,
                            color: Colors.blue,
                            child: Image.network(
                              welcome?.categories?[index].image ?? "NA",
                              scale: 2,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 10,
                            child: SizedBox(
                              width: 80,
                              child: CommonText(
                                text:
                                    welcome?.categories?[index].categoryName ??
                                    "NA",
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
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
                  child: CommonCard(
                    showDate: false,
                    image:
                        "https://blog.nasm.org/hubfs/women-weight-lifting.jpg",
                    title: welcome?.topClass?[index].title ?? "",
                    subTitle: welcome?.topClass?[index].subTitle ?? "",
                    address: welcome?.topClass?[index].address ?? "",
                    rating: (welcome?.topClass?[index].rating ?? "") as double,
                    isFav: welcome?.topClass?[index].isFavourite ?? false,
                    distance:
                        double.tryParse(
                          welcome?.topClass?[index].distance ?? "0",
                        ) ??
                        0.0,
                    onTap: () {
                      setState(() {
                        isLike=!isLike;
                        FavouriteController.favouriteList.add(
                          FavouriteModel(
                            image:
                            "https://blog.nasm.org/hubfs/women-weight-lifting.jpg",
                            title: welcome?.topClass?[index].title ?? "",
                            address: welcome?.topClass?[index].address ?? "",
                            distance: welcome?.topClass?[index].distance ?? "0",
                            rating: welcome?.topClass?[index].rating ?? 0,
                            isLike: isLike
                          ),
                        );
                        welcome?.topClass?[index].isFavourite=isLike;
                      });

                    },
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
