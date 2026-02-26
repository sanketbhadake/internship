import 'package:flutter/material.dart';

class BasedModel {
  final String label;
  final String icon;
  final int id;
  final Widget screen;
  bool isSelectd;

  BasedModel({
    required this.label,
    required this.icon,
    required this.id,
    required this.screen,
    required this.isSelectd,
  });
}
