import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kody_test/freamwork/repository/based_model.dart';
import 'package:kody_test/freamwork/repository/home/home_model.dart';

import '../../ui/home/home.dart';

final controller = ChangeNotifierProvider((ref) => BasedController());

class BasedController extends ChangeNotifier {
  Welcome? welcome;

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
  void navIndex(int index){
      currentIndex=index;
    notifyListeners();

  }
  static List<BasedModel> navigation = [
    BasedModel(
      label: "home",
      icon: Icon(Icons.home),
      id: 0,
      screen: HomeScreen(),
    ),
    BasedModel(
      label: "order",
      icon: Icon(Icons.calendar_today_outlined),
      id: 1,
      screen: HomeScreen(),
    ),
    BasedModel(
      label: "cart",
      icon: Icon(Icons.shopping_cart),
      id: 2,
      screen: HomeScreen(),
    ),
    BasedModel(
      label: "profile",
      icon: Icon(Icons.person),
      id: 3,
      screen: HomeScreen(),
    ),
  ];
}
