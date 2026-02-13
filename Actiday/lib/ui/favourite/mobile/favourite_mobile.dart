import 'package:actiday/framework/controller/favourite/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../home/helper/common_card.dart';
import '../../utils/theme/app_assets.dart';
import '../../utils/widgets/common_text.dart';

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
        title: CommonText(text: "My Favorite", fontSize: 12),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: FavouriteController.favouriteList.length,

          itemBuilder: (context, index) {
            final item = FavouriteController.favouriteList;
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: CommonCard(
                showDate: false,

                image: item[index].image ?? "",
                title: item[index].title ?? "",

                address: item[index].address ?? "",
                rating: (item[index].rating ?? 0) as double,
                isFav: item[index].isLike,
                onTap: (){
                  setState(() {
                    item.removeAt(index);
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
