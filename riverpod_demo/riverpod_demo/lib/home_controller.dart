import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final homeController = ChangeNotifierProvider<HomeController>((ref) {
  return HomeController();
});

class HomeController extends ChangeNotifier {
  bool isRed = true; // start with RED

  void setIsRed(bool val) {
    isRed = val;
    notifyListeners();
  }

  void toggle() {
    isRed = !isRed;
    notifyListeners();
  }
}