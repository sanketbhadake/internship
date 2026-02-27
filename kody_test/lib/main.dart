import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kody_test/ui/home/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark,),
          fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
