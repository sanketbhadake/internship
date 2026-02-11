import 'package:actiday/ui/Booking/booking.dart';
import 'package:actiday/ui/explore/explore.dart';
import 'package:actiday/ui/favourite/favourite.dart';
import 'package:actiday/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_constant.dart';
import '../../repository/based model/model_class.dart';

class BottomList {
  static List<BottomMenu> bottomMenuList = [
    BottomMenu(
      id: 0,
      name: BottomNaviItems.Home.name,
      icon: Icon(Icons.home),
      screen: HomeScreen(),
      isSelect: true,

    ),
    BottomMenu(
      id: 1,
      name: BottomNaviItems.Booking.name,
      icon: Icon(Icons.calendar_today_outlined),
      screen: Booking(),
    ),
    BottomMenu(
      id: 2,
      name: BottomNaviItems.Explore.name,
      icon: Icon(Icons.explore),
      screen: Explore(),
    ),
    BottomMenu(
      id: 3,
      name: BottomNaviItems.Favourite.name,
      icon: Icon(Icons.favorite_border_rounded),
      screen: Favourite(),
    ),
  ];
}
