import 'package:actiday/framework/controller/favourite/favourite_controller.dart';
import 'package:actiday/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../home/helper/common_card.dart';
import '../../utils/widgets/common_footer.dart';
import '../../utils/widgets/common_text.dart';

class FavouriteWeb extends StatefulWidget {
  const FavouriteWeb({super.key});

  @override
  State<FavouriteWeb> createState() => _FavouriteWebState();
}

class _FavouriteWebState extends State<FavouriteWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100.0,
                vertical: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/svgs/home.svg"),
                      Icon(Icons.arrow_forward_ios_outlined),
                      CommonText(text: "Favourite", fontSize: 12),
                    ],
                  ),
                  SizedBox(height: 20),
                  CommonText(
                    text: "Favourite",
                    fontSize: 16,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 20),
                  FavouriteController.favouriteList.isEmpty
                      ? Center(
                          child: CommonText(
                            text: "No Favourite found",
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 30,
                                mainAxisExtent: 290
                              ),
                          shrinkWrap: true,
                          itemCount: FavouriteController.favouriteList.length,
                          itemBuilder: (context, index) {
                            final item = FavouriteController.favouriteList;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: CommonCard(
                                image: item[index].image ?? "",
                                title: item[index].title ?? "",
                                distance:
                                    double.tryParse(
                                      item[index].distance ?? "",
                                    ) ??
                                    0,

                                address: item[index].address ?? "",
                                rating: item[index].rating ?? 0,
                                isFav: item[index].isLike,
                                onTap: () {
                                  setState(() {
                                    final removeItem = FavouriteController.favouriteList[index];
                                    // SplashScreenState.welcome?.topClass?[index];

                                    final homeItem=SplashScreenState.welcome?.topClass?.firstWhere((fav)=>fav.id==removeItem.id);

                                   homeItem?.isFavourite=false;
                                   FavouriteController.favouriteList.removeAt(index);

                                  });
                                },
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
            FavouriteController.favouriteList.isEmpty
                ? SizedBox(height: 200)
                : SizedBox(height: 1),
            CommonFooter(),
          ],
        ),
      ),
    );
  }
}
