import 'package:flutter/material.dart';

class BasedModel {
  final String label;
  final Icon icon;
  final int id;
  final Widget screen;

  BasedModel({
    required this.label,
    required this.icon,
    required this.id,
    required this.screen,
  });
}
