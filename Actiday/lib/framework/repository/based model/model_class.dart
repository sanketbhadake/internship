import 'package:flutter/cupertino.dart';

class BottomMenu {
  final int id;
  final String name;
  final Icon icon;
  final Widget screen;
  late bool isSelect;

  BottomMenu({
    required this.name,
    required this.icon,
    required this.screen,
    this.isSelect = false,
    required this.id,
  });
}
