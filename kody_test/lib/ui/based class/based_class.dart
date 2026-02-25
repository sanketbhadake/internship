import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/based_class_mobile.dart';

class BasedClass extends StatefulWidget {
  const BasedClass({super.key});

  @override
  State<BasedClass> createState() => _BasedClassState();
}

class _BasedClassState extends State<BasedClass> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context){
        return BasedClassMobile();
      },
    );
  }
}
