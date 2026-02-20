import 'package:actiday/framework/controller/favourite/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:actiday/ui/home/helper/common_card.dart';
import 'package:actiday/ui/splash/splash_screen.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';

class FavouriteMobile extends StatefulWidget {
  const FavouriteMobile({super.key});

  @override
  State<FavouriteMobile> createState() => _FavouriteMobileState();
}

class _FavouriteMobileState extends State<FavouriteMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SvgPicture.asset(AppAssets.category),
        ),
        leadingWidth: 50,
        title: const CommonText(text: "My Favorite", fontSize: 16),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FavouriteController.favouriteList.isEmpty
            ? const Center(
                child: CommonText(
                  text: "No Favourite found",
                  fontSize: 18,
                  color: Colors.black,
                ),
              )
            : ListView.builder(
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
                          double.tryParse(item[index].distance ?? "") ?? 0,

                      address: item[index].address ?? "",
                      rating: item[index].rating ?? 0,
                      isFav: item[index].isLike,
                      onTap: () {
                        setState(() {
                          final removedItem =
                              FavouriteController.favouriteList[index];

                          // Update Home list
                          final homeItem = SplashScreenState.welcome?.topClass
                              ?.firstWhere(
                                (element) => element.id == removedItem.id,
                              );

                          homeItem?.isFavourite = false;

                          // Remove from favourite list
                          FavouriteController.favouriteList.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
