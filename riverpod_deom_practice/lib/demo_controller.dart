import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

final controller = ChangeNotifierProvider((ref) => DemoController());

class DemoController extends ChangeNotifier {
  bool isClicked=true ;
  void changeColorButtonOne() {

    isClicked=!isClicked;
    notifyListeners();

  }

}
