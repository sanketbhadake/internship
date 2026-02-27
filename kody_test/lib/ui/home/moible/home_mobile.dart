import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kody_test/freamwork/controller/based_controller.dart';
import 'package:kody_test/freamwork/repository/home/home_model.dart';
import 'package:kody_test/ui/utils/Widgets/common_button.dart';
import 'package:kody_test/ui/utils/Widgets/common_container.dart';
import 'package:kody_test/ui/utils/Widgets/common_net_image.dart';
import 'package:kody_test/ui/utils/Widgets/common_sizedbox.dart';
import 'package:kody_test/ui/utils/Widgets/common_text.dart';
import 'package:kody_test/ui/utils/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:kody_test/ui/utils/Widgets/common_size.dart';

class HomeMobile extends ConsumerStatefulWidget {
  const HomeMobile({super.key});

  @override
  ConsumerState<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends ConsumerState<HomeMobile> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(controller).loadHomeJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    final updateState = ref.watch(controller);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        toolbarHeight: 80,
        flexibleSpace: header(),
        bottom: PreferredSize(
          preferredSize: Size(context.screenWidth, 40),
          child: Transform.translate(
            offset: const Offset(0, 20),
            child: searchBar(),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: (updateState.welcome == null)
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 180),

                /// carousel slider with indicator
                carouselWidget(updateState.welcome, context, updateState),

                /// categories section
                headerText("Categories", false),
                categories(updateState.welcome),

                /// recently order section
                headerText("Recently Ordered On MenuBox", false),
                recentlyOrder(updateState.welcome),

                /// exciting order section
                headerText("Exciting Offers", true),
                excitingOffer(updateState.welcome),

                /// spotlight section
                headerText("In the Spotlight", true),
                spotLight(updateState.welcome),

                /// all store order section
                headerText("All Stores", false),
                allStore(updateState.welcome),

                ///view button
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CommonButton(
                    height: 52,
                    title: "VIEW ALL RESTAURANTS",
                    onTap: () {},
                    color: Colors.black,
                    txtColor: Colors.white,
                    borderRadius: 23,
                  ),
                ),
              ],
            ),
          ),

      ///Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        items: BasedController.navigation.map((data) {
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(data.icon, color: Colors.grey),
            label: data.label,
            activeIcon: SvgPicture.asset(data.icon, color: Colors.black),
          );
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

  Widget searchBar() {
    return CommonContainer(
      height: 44,
      width: context.screenWidth * 0.9,
      borderRadius: 22,
      shadow: true,
      color: Colors.white,
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_sharp),
          border: InputBorder.none,
          hint: CommonText(text: "Restaurants, Foods...", color: Colors.grey),
        ),
      ),
    );
  }

  Widget carouselWidget(
    HomeModel? item,
    BuildContext context,
    BasedController updateState,
  ) {
    return Column(
      children: [
        CarouselSlider(
          items: item?.banner?.map((data) {
            return Container(
              height: context.screenHeight,
              width: context.screenWidth,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: CommonNetworkImage(imageUrl: data),
            );
          }).toList(),

          options: CarouselOptions(
            height: 140,
            viewportFraction: 0.7,
            autoPlay: true,
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: true,
            animateToClosest: true,
            onPageChanged: (index, reason) {
              updateState.getCurrentIndex(index);
            },
          ),
        ),
        Space.h20,
        Center(
          child: SmoothPageIndicator(
            controller: PageController(
              initialPage: BasedController.carouselIndex,
            ),
            count: item?.banner?.length ?? 0,
            effect: const ExpandingDotsEffect(
              dotHeight: 7,
              dotWidth: 7,
              expansionFactor: 7,
              activeDotColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget headerText(String title, bool isShow) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CommonText(text: title, fontSize: 18, weight: FontWeight.w600),
          const Spacer(),
          Visibility(
            visible: isShow,
            child: const InkWell(
              child: CommonText(text: "View ALL", weight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      // height: 100,
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

            SizedBox(width: 92),

            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonText(
                  text: "Your location",
                  fontSize: 12,

                  color: AppColors.clrWhite,
                ),
                Row(
                  children: [
                    CommonText(
                      text: "Punjab, India",
                      fontSize: 16,
                      weight: FontWeight.w600,
                      color: AppColors.clrWhite,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset("assets/svgs/svg_notification.svg"),
            Space.w10,
            SvgPicture.asset("assets/svgs/svg_favourite.svg"),
          ],
        ),
      ),
    );
  }

  Widget categories(HomeModel? item) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0.2,
                    color: Colors.grey,
                    offset: Offset(0, 1),
                    blurRadius: 5,
                  ),
                ],
              ),
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

  Widget recentlyOrder(HomeModel? item) {
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
                child: Stack(
                  children: [
                    CommonContainer(
                      height: 110,
                      width: 110,
                      borderRadius: 16,
                      color: Colors.white,
                      // shadow: true,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.network(
                          item?.recentOrders?[index].image ?? '',

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
                    Positioned(
                      top: -2,
                      right: 18,
                      child: SvgPicture.asset("assets/svgs/svg_tag.svg"),
                    ),
                  ],
                ),
              ),
              Space.h10,
              CommonText(
                text: item?.recentOrders?[index].name ?? '',
                fontSize: 14,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget excitingOffer(HomeModel? item) {
    return SizedBox(
      height: 250,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget spotLight(HomeModel? item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 140,
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
                    height: 110,
                    width: 110,
                    borderRadius: 16,
                    color: Colors.white,
                    shadow: true,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image.network(
                        item?.spotlight?[index].image ?? '',

                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            "https://m.media-amazon.com/images/I/71DCZ-I6agL._AC_UF894,1000_QL80_.jpg",
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Space.h10,
                CommonText(
                  text: item?.spotlight?[index].name ?? '',
                  fontSize: 14,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget allStore(HomeModel? item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,

        physics: const NeverScrollableScrollPhysics(),
        itemCount: item?.stores?.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Stack(
            children: [
              CommonContainer(
                // shadow: true,
                // color: Colors.white,
                borderRadius: 14,
                child: Column(
                  children: [
                    CommonContainer(
                      height: 130,
                      borderRadius: 14,
                      width: double.infinity,
                      color: Colors.white,
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
                                CommonText(
                                  text: item?.stores?[index].name ?? '',
                                  weight: FontWeight.w600,
                                ),
                                const Spacer(),
                                CommonText(
                                  text:
                                      "Free delivery up to ${item?.stores?[index].freeDeliveryKm ?? ''} km",
                                  color: AppColors.clrGreen,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/svgs/svg_star.svg"),
                                const SizedBox(width: 5),
                                CommonText(
                                  text: item?.stores?[index].rating ?? '',
                                ),
                                const SizedBox(width: 3),
                                CommonText(
                                  text:
                                      "(${item?.stores?[index].review ?? ''}+)",
                                  color: Colors.grey,
                                ),
                                const Spacer(),

                                SvgPicture.asset("assets/svgs/svg_timer.svg"),
                                const SizedBox(width: 3),

                                CommonText(
                                  text: item?.stores?[index].deliveryTime ?? '',
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const CommonText(
                                  text: "Min. order ",
                                  color: Colors.grey,
                                ),
                                CommonText(
                                  text:
                                      "${item?.stores?[index].minOrder ?? ''} INR",
                                ),

                                const Spacer(),

                                SvgPicture.asset(
                                  "assets/svgs/svg_google_map.svg",
                                ),
                                const SizedBox(width: 3),
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

                      decoration: const BoxDecoration(
                        color: AppColors.clrGreen,
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
                              text: item?.stores?[index].offer?.title ?? '',
                              color: Colors.white,
                              weight: FontWeight.w600,
                              overFlow: true,
                            ),
                            const Spacer(),
                            CommonText(
                              text: item?.stores?[index].offer?.code ?? '',
                              color: Colors.white,
                              weight: FontWeight.w600,
                              overFlow: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -2,
                right: 20,
                child: SvgPicture.asset("assets/svgs/svg_tag.svg"),
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
}
