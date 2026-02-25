import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kody_test/freamwork/controller/based_controller.dart';
import 'package:kody_test/freamwork/repository/home/home_model.dart';
import 'package:kody_test/ui/utils/Widgets/common_container.dart';
import 'package:kody_test/ui/utils/Widgets/common_net_image.dart';
import 'package:kody_test/ui/utils/Widgets/common_sizedbox.dart';
import 'package:kody_test/ui/utils/Widgets/common_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/Widgets/common_size.dart';

int _currentIndex = 0;

class HomeMobile extends ConsumerStatefulWidget {
  const HomeMobile({super.key});

  @override
  ConsumerState<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends ConsumerState<HomeMobile> {
  @override
  void initState() {
    super.initState();
    ref.read(controller).loadHomeJson();
  }

  @override
  Widget build(BuildContext context) {
    final sizedWidth = MediaQuery.of(context).size.width;
    final sizedHeight = MediaQuery.of(context).size.height;
    final updateState = ref.watch(controller);
    final item = updateState.welcome;
    return Scaffold(

      body: (updateState.welcome == null)
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Stack(
                children: [
                  ///Body
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 140),
                        CarouselSlider(
                          items: item?.banner?.map((data) {
                            return Container(
                              height: sizedHeight,
                              width: sizedWidth,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: CommonNetworkImage(imageUrl: data),
                            );
                          }).toList(),

                          options: CarouselOptions(
                            height: 120,
                            viewportFraction: 0.7,
                            autoPlay: true,
                            autoPlayCurve: Curves.easeInOut,
                            enlargeCenterPage: true,
                            animateToClosest: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                        ),
                        Space.h20,
                        Center(
                          child: SmoothPageIndicator(
                            controller: PageController(
                              initialPage: _currentIndex,
                            ),
                            count: item?.banner?.length ?? 0,
                            effect: ExpandingDotsEffect(
                              dotHeight: 7,
                              dotWidth: 7,
                              expansionFactor: 7,
                              activeDotColor: Colors.black,
                            ),
                          ),
                        ),
                        headerText("Categories", false),

                        categories(item),
                        headerText("Recently Ordered On MenuBox", false),

                        recentlyOrder(item),
                        headerText("Exciting Offers", true),

                        excitingOffer(item),

                        headerText("In the Spotlight", true),

                        spotLight(item),

                        headerText("All Stores", false),

                        allStore(item),
                      ],
                    ),
                  ),
                  appBar(context),
                ],
              ),
            ),

      bottomNavigationBar: BottomNavigationBar(
        items: BasedController.navigation.map((data) {
          return BottomNavigationBarItem(icon: data.icon, label: data.label);
        }).toList(),
        onTap: (index) {
          updateState.navIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: BasedController.currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

Widget headerText(String title, bool isShow) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CommonText(text: title,fontSize: 18, weight: FontWeight.bold),
        Spacer(),
        Visibility(
          visible: isShow,
          child: InkWell(child: CommonText(text: "View ALL", weight: FontWeight.bold)),
        ),
      ],
    ),
  );
}

Widget appBar(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 100,
        width: context.screenWidth,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
          color: Color(0xff070707),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SvgPicture.asset("assets/svgs/svg_category.svg"),

              Spacer(),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your location", style: TextStyle(color: Colors.white)),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "Punjab, India",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),

              Icon(Icons.notifications_outlined, color: Colors.white),
              Space.w10,
              Icon(Icons.favorite_border_rounded, color: Colors.white),
            ],
          ),
        ),
      ),
      Positioned(
        top: 80,
        left: 40,
        child: CommonContainer(
          height: 44,
          width: context.screenWidth * 0.8,
          borderRadius: 22,
          shadow: true,
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_sharp),
              border: InputBorder.none,
              hint: Text(
                "Restaurants, Foods...",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget categories(Welcome? item) {
  return GridView.builder(
    shrinkWrap: true,
    clipBehavior: Clip.none,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 10,
      crossAxisCount: 3,
      mainAxisExtent: 140,
      mainAxisSpacing: 10,
    ),
    itemCount: item?.categories?.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          Container(
            height: 95,
            width: 95,
            decoration: BoxDecoration(shape: BoxShape.circle,
                color: Colors.white,
                boxShadow:   [
                BoxShadow(
                  spreadRadius: 1,
                  color: Colors.grey,
                  offset: Offset(0, 1),
                  blurRadius: 7,
                )
                ]),
            clipBehavior: Clip.antiAlias,
            child: CommonNetworkImage(
              imageUrl: item?.categories?[index].image ?? '',
            ),
          ),
          Space.h10,
          CommonText(text: item?.categories?[index].name ?? ''),
        ],
      );
    },
  );
}

Widget recentlyOrder(Welcome? item) {
  return SizedBox(
    height: 140,
    child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.none,
      shrinkWrap: true,
      itemCount: item?.recentOrders?.length,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: CommonContainer(
                height: 80,
                width: 80,
                borderRadius: 16,
                color: Colors.white,
                shadow: true,
                child: Image.network(
                  item?.recentOrders?[index].image ?? '',
                  height: 10,
                  width: 10,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      "https://m.media-amazon.com/images/I/71DCZ-I6agL._AC_UF894,1000_QL80_.jpg",
                      height: 10,
                      width: 10,
                    );
                  },
                ),
              ),
            ),
            Space.h10,
            CommonText(
              text: item?.recentOrders?[index].name ?? '',
              fontSize: 12,
            ),
          ],
        );
      },
    ),
  );
}

Widget excitingOffer(Welcome? item) {
  return SizedBox(
    height: 250,
    child: GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisExtent: 350,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: item?.existingOffers?.length,
      itemBuilder: (context, index) => Column(
        children: [
          CommonContainer(
            // color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonContainer(
                    height: 85,
                    width: 85,
                    borderRadius: 12,
                    borderColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        item?.existingOffers?[index].image ?? '',
                        height: 40,
                        width: 40,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            "https://m.media-amazon.com/images/I/71DCZ-I6agL._AC_UF894,1000_QL80_.jpg",
                            height: 40,
                            width: 40,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Space.w10,

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: item?.existingOffers?[index].name ?? '',
                        weight: FontWeight.bold,
                      ),
                      CommonText(
                        text: item?.existingOffers?[index].subtitle ?? '',
                        color: Colors.grey,
                      ),
                      CommonText(
                        text: item?.existingOffers?[index].offerTitle ?? '',
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    ),
  );
}

Widget spotLight(Welcome? item) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 110,

      child: ListView.builder(
        clipBehavior: Clip.none,
        shrinkWrap: true,
        itemCount: item?.spotlight?.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: CommonContainer(
                  height: 80,
                  width: 80,
                  borderRadius: 16,
                  color: Colors.white,
                  shadow: true,
                  child: Image.network(
                    item?.spotlight?[index].image ?? '',
                    height: 10,
                    width: 10,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        "https://m.media-amazon.com/images/I/71DCZ-I6agL._AC_UF894,1000_QL80_.jpg",
                        height: 10,
                        width: 10,
                      );
                    },
                  ),
                ),
              ),
              Space.h10,
              CommonText(
                text: item?.spotlight?[index].name ?? '',
                fontSize: 12,
              ),
            ],
          );
        },
      ),
      decoration: BoxDecoration(),
      clipBehavior: Clip.none,
    ),
  );
}

Widget allStore(Welcome? item) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: item?.stores?.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Stack(
          children: [
            CommonContainer(
              shadow: true,
              color: Colors.white,
              borderRadius: 14,
              child: Column(
                children: [
                  CommonContainer(
                    height: 130,
                    borderRadius: 14,
                    width: double.infinity,

                    child: Image.network(
                      item?.stores?[index].banner ?? '',
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          "https://m.media-amazon.com/images/I/71DCZ-I6agL._AC_UF894,1000_QL80_.jpg",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  CommonContainer(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CommonText(text: item?.stores?[index].name ?? ''),
                              Spacer(),
                              CommonText(
                                text:
                                    "Free delivery up to ${item?.stores?[index].freeDeliveryKm ?? ''} km",
                                color: Colors.green,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star),
                              CommonText(
                                text: item?.stores?[index].rating ?? '',
                              ),

                              CommonText(
                                text: "(${item?.stores?[index].review ?? ''}+)",
                                color: Colors.grey,
                              ),
                              Spacer(),
                              Icon(Icons.timer),
                              CommonText(
                                text: item?.stores?[index].deliveryTime ?? '',
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CommonText(
                                text: "Min. order ",
                                color: Colors.grey,
                              ),
                              CommonText(
                                text:
                                    "${item?.stores?[index].minOrder ?? ''} INR",
                              ),

                              Spacer(),
                              Icon(Icons.location_on),
                              CommonText(
                                text: item?.stores?[index].distance ?? '',
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 30,

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          CommonText(
                            text: item!.stores![index].offer?.title ?? '',
                            color: Colors.white,
                          ),
                          Spacer(),
                          CommonText(
                            text: item!.stores![index].offer?.code ?? '',
                            color: Colors.white,
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
              left: 10,
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                  item?.stores?[index].banner ?? '',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
