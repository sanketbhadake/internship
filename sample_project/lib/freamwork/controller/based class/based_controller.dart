
import 'package:flutter/material.dart';
import 'package:sample_project/freamwork/repository/based%20class/based_model.dart';
import 'package:sample_project/ui/home/home..dart';

import '../../../ui/home/orders.dart';

class BasedController {
  static int currentIndex=0;
  static List<BasedModel> navigation=[
  BasedModel(label: "home", icon: Icon(Icons.home), id: 0,screen: Home()),
  BasedModel(label: "fav", icon: Icon(Icons.favorite_border_rounded), id: 1,screen: Home()),
  BasedModel(label: "explore", icon: Icon(Icons.explore), id: 2,screen: Home()),
  BasedModel(label: "order", icon: Icon(Icons.shopping_bag), id: 3,screen: Orders()),
  ];
}