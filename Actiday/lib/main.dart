import 'package:actiday/ui/based%20class/mobile/based_class_mobile.dart';
import 'package:actiday/ui/based%20class/web/based_class_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
            )
        ),
        home: ScreenTypeLayout.builder(
          mobile: (BuildContext context) {
            return BasedClassMobile();
          },
          desktop: (BuildContext context) {
            return BasedClassWeb();
          },
        ),
    );
  }
}
