import 'package:actiday/ui/based%20class/mobile/based_class_mobile.dart';
import 'package:actiday/ui/based%20class/web/based_class_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BasedClass extends StatefulWidget {
  static int selectIndex=0;
  const BasedClass({super.key});

  @override
  State<BasedClass> createState() => _BasedClassState();
}

class _BasedClassState extends State<BasedClass> {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return const BasedClassMobile();
      },
      desktop: (BuildContext context) {
        return const BasedClassWeb();
      },
    );
  }
}
