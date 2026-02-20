import 'package:actiday/ui/splash/mobile/splash_screen_mobile.dart';
import 'package:actiday/ui/splash/web/splash_screen_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../framework/repository/booking/booking_model.dart';
import '../../framework/repository/home/home_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static Welcome? welcome;
  static WelcomeBook? booking;

  @override
  void initState() {
    super.initState();
    loadHomeJson();
    loadBookingJson();
  }

  Future<void> loadHomeJson() async {
    final String response = await rootBundle.loadString(
      'assets/json/json_home.json',
    );
    final data = welcomeFromJson(response);
    setState(() {
      welcome = data;
    });
  }

  Future<void> loadBookingJson() async {
    final String response = await rootBundle.loadString(
      'assets/json/json_bookings.json',
    );
    final data = welcomeFromBookJson(response);
    setState(() {
      booking = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return const SplashScreenMobile();
      },
      desktop: (BuildContext context) {
        return const SplashScreenWeb();
      },
    );
  }
}
