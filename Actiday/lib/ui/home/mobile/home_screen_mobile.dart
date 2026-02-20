import 'package:actiday/framework/controller/favourite/favourite_controller.dart';
import 'package:actiday/framework/repository/favourite/favourite_model.dart';
import 'package:actiday/ui/home/helper/common_card.dart';
import 'package:actiday/ui/home/helper/common_carousel.dart';
import 'package:actiday/ui/home/helper/common_categories.dart';
import 'package:actiday/ui/login/login_screen.dart';
import 'package:actiday/ui/splash/splash_screen.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:actiday/ui/utils/widgets/common_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  final homeData = SplashScreenState.welcome;

  /// AlertBox
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
                const CommonText(text: "Are you sure to Logout", fontSize: 16),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CommonContainer(
                        height: 30,
                        width: 80,
                        borderRadius: 10,
                        borderColor: Colors.black,

                        child: Center(
                          child: CommonText(
                            text: "NO",
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const CommonContainer(
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
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 80),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Future.delayed(const Duration(milliseconds: 50), () {
                  showAlertBoxModel();
                });
              },
              child: const ListTile(
                title: CommonText(text: "Logout", fontSize: 14),
                leading: Icon(Icons.logout_outlined),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: SvgPicture.asset(AppAssets.category),
            ),
          ),
        ),
        leadingWidth: 50,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on),
            CommonText(text: "Abu Dhabi, UAE", fontSize: 12),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
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
              const CommonTextForm(
                hint: "yoga, pilates, massage",
                preFixIcon: Icon(Icons.search_sharp),
              ),
              const SizedBox(height: 20),
              const CommonCarousel(showIndicator: false, height: 150),
              const SizedBox(height: 20),
              const CommonText(text: "Active Lifestyle", fontSize: 16),
              const CommonText(
                text: "Get active every day Try new things \nFind new classes",
                fontSize: 12,
              ),
              const SizedBox(height: 20),
              const CommonText(
                text: "Catagories",
                fontSize: 18,
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 20),

              SizedBox(
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: homeData?.categories?.length ?? 0,

                  itemBuilder: (context, index) => CommonCategories(
                    height: 120,
                    width: 175,
                    image: homeData?.categories?[index].image,

                    title: homeData?.categories?[index].categoryName,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Row(
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
              const SizedBox(height: 20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: homeData?.topClass?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CommonCard(
                      image:
                          "https://blog.nasm.org/hubfs/women-weight-lifting.jpg",
                      title: homeData?.topClass?[index].title ?? "",
                      subTitle: homeData?.topClass?[index].subTitle ?? "",
                      address: homeData?.topClass?[index].address ?? "",
                      rating: homeData?.topClass?[index].rating ?? 0,
                      isFav: homeData?.topClass?[index].isFavourite,
                      distance:
                          double.tryParse(
                            homeData?.topClass?[index].distance ?? "0",
                          ) ??
                          0.0,
                      onTap: () {
                        setState(() {
                          final item = homeData?.topClass?[index];
                          if (item == null) return;
                          item.isFavourite = !(item.isFavourite ?? false);

                          if (item.isFavourite == true) {
                            FavouriteController.favouriteList.add(
                              FavouriteModel(
                                id: item.id,
                                image:
                                    "https://blog.nasm.org/hubfs/women-weight-lifting.jpg",
                                title: item.title ?? "",
                                address: item.address ?? "",
                                distance: item.distance ?? "0",
                                rating: item.rating ?? 0,
                                isLike: true,
                              ),
                            );
                          } else {
                            FavouriteController.favouriteList.removeWhere(
                              (fav) => fav.id == item.id,
                            );
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
