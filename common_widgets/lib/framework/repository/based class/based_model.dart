import 'package:flutter/material.dart';

class BasedModel {
  final int id;
  final Widget widget;
  final Widget screen;
  final String label;
  final bool isSelect;

  BasedModel({
    required this.id,
    required this.widget,
    required this.screen,
    required this.label,
    required this.isSelect,
  });
}
