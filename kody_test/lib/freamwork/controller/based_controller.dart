import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kody_test/freamwork/repository/based_model.dart';
import 'package:kody_test/freamwork/repository/home/home_model.dart';
import 'package:kody_test/ui/utils/theme/app_assets.dart';

import '../../ui/home/home.dart';

final controller = ChangeNotifierProvider((ref) => BasedController());

class BasedController extends ChangeNotifier {
  HomeModel? welcome;
  static int carouselIndex = 0;
  bool isSelectd= false;

  void getCurrentIndex(int index) {
    carouselIndex = index;
    notifyListeners();
  }

  Future<void> loadHomeJson() async {
    final String response = await rootBundle.loadString(
      'assets/json/json_menubox.json',
    );
    final data = welcomeFromJson(response);

    welcome = data;
    print("data===== $welcome");
    notifyListeners();
  }

  static int currentIndex = 0;

  void navIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  static List<BasedModel> navigation = [
    BasedModel(
      label: "home",
      icon: AppAssets.svgBottomHome,
      id: 0,
      screen: HomeScreen(),

    ),
    BasedModel(
      label: "order",
      icon:   AppAssets.svgBottomCartSvg,
      id: 1,
      screen: HomeScreen(),


    ),
    BasedModel(
      label: "cart",
      icon:  AppAssets.svgBottomCartSvg,
      id: 2,
      screen: HomeScreen(),


    ),
    BasedModel(
      label: "profile",
      icon: AppAssets.svgBottomProfile,
      id: 3,
      screen: HomeScreen(),


    ),
  ];
}
