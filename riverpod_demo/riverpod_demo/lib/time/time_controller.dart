import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

final controller = ChangeNotifierProvider<TimeController>((ref) => TimeController());

class TimeController extends ChangeNotifier {
  late Timer timer;
  String currentTime = DateTime.now().toString();
  int count =0;
  TimeController() {
    Timer.periodic(Duration(microseconds: 1), (_) {
      currentTime = DateTime.now().toString();

      print("CAllED $count");
      count++;
      notifyListeners();
    });
  }
}
