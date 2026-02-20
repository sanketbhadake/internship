import 'package:actiday/ui/home/helper/common_carousel.dart';
import 'package:flutter/material.dart';
import 'package:actiday/framework/controller/favourite/favourite_controller.dart';
import 'package:actiday/framework/repository/favourite/favourite_model.dart';
import 'package:actiday/ui/splash/splash_screen.dart';
import 'package:actiday/ui/utils/widgets/common_footer.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:actiday/ui/home/helper/common_card.dart';
import 'package:actiday/ui/home/helper/common_categories.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  final homeData = SplashScreenState.welcome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonCarousel(showIndicator: true, height: 220),
                  const SizedBox(height: 20),
                  const CommonText(
                    text: "Royal Peace Spa",
                    weight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const CommonText(
                    text:
                        "Relax and rejuvenate with the traditional Thai dry therapy Relax and rejuvenate with the",
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  const CommonText(
                    text: "Catagories",
                    weight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: homeData?.categories?.length ?? 0,
                      itemBuilder: (context, index) => CommonCategories(
                        height: 220,
                        width: 570,
                        image: homeData?.categories?[index].image,
                        title: SplashScreenState
                            .welcome
                            ?.categories?[index]
                            .categoryName,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const CommonText(
                    text: "Top Classes",
                    weight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 30,
                          mainAxisExtent: 270,
                        ),
                    itemCount: homeData?.topClass?.length ?? 0,
                    itemBuilder: (context, index) => CommonCard(
                      image:
                          "https://blog.nasm.org/hubfs/women-weight-lifting.jpg",
                      title: homeData?.topClass?[index].title ?? "",
                      subTitle:
                          SplashScreenState
                              .welcome
                              ?.topClass?[index]
                              .subTitle ??
                          "",
                      address: homeData?.topClass?[index].address ?? "",
                      rating: homeData?.topClass?[index].rating ?? 0,
                      isFav: SplashScreenState
                          .welcome
                          ?.topClass?[index]
                          .isFavourite,
                      distance:
                          double.tryParse(
                            homeData?.topClass?[index].distance ?? "0",
                          ) ??
                          0.0,
                      onTap: () {
                        setState(() {
                          final item = homeData?.topClass?[index];
                          if (item == null) return; //check item not null

                          item.isFavourite = !(item.isFavourite ?? false);

                          if (item.isFavourite == true) {
                            FavouriteController.favouriteList.add(
                              FavouriteModel(
                                id: homeData?.topClass?[index].id,
                                image:
                                    "https://blog.nasm.org/hubfs/women-weight-lifting.jpg",
                                title: homeData?.topClass?[index].title ?? "",
                                address:
                                    homeData?.topClass?[index].address ?? "",
                                distance:
                                    homeData?.topClass?[index].distance ?? "0",
                                rating: homeData?.topClass?[index].rating ?? 0,
                                isLike: true,
                              ),
                            );
                          } else {
                            // Remove from favourites by matching title (or unique id)
                            FavouriteController.favouriteList.removeWhere(
                              (fav) => fav.id == item.id,
                            );
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const CommonFooter(),
          ],
        ),
      ),
    );
  }
}
