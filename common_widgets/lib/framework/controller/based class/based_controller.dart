import 'package:common_widgets/framework/repository/based%20class/based_model.dart';
import 'package:common_widgets/ui/home/home.dart';
import 'package:common_widgets/ui/favourite/favourite.dart';
import 'package:flutter/material.dart';

class BasedController {
  static List<BasedModel> bottomNavController = [
    BasedModel(
      id: 0,
      widget: Icon(Icons.home),
      screen: Home(),
      label: "Home",
      isSelect: false,
    ),
    BasedModel(
      id: 1,
      widget: Icon(Icons.search),
      screen: Home(),
      label: "Search",
      isSelect: false,
    ),
    BasedModel(
      id: 2,
      widget: Icon(Icons.favorite),
      screen: Favourite(),
      label: "Favourite",
      isSelect: false,
    ),
    BasedModel(
      id: 3,
      widget: Icon(Icons.shopping_cart),
      screen: Home(),
      label: "Orders",
      isSelect: false,
    ),
  ];
  static int currentIndex=0;
}
