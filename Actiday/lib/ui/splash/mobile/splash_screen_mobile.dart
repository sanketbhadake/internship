
import 'package:actiday/framework/repository/booking/booking_model.dart';
import 'package:actiday/ui/splash/helper/common_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../framework/repository/home/home_model.dart';
import '../../login/login_screen.dart';

class SplashScreenMobile extends StatefulWidget {
  const SplashScreenMobile({super.key});

  @override
  State<SplashScreenMobile> createState() => _SplashScreenMobileState();
}

class _SplashScreenMobileState extends State<SplashScreenMobile> {
  static Welcome? welcome;
  static WelcomeBook? booking;

  @override
  void initState()   {
    super.initState();
    loadHomeJson();
    loadBookingJson();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }
  Future<void> loadHomeJson() async {
    final String response = await rootBundle.loadString(
      'assets/json/home.json',
    );
    final data = welcomeFromJson(response);
    setState(() {
      welcome = data;

    });
  }
  Future<void> loadBookingJson() async {
    final String response = await rootBundle.loadString(
      'assets/json/bookings.json',
    );
    final data = welcomeFromBookJson(response);
    setState(() {
      booking = data;
      print("book data loaded : $booking ");

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: CommonImage(imageHeight: 140, imageWidth: 140));
  }
}
