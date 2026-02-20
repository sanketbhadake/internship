
import 'package:actiday/ui/Booking/mobile/booking_mobile.dart';
import 'package:actiday/ui/Booking/web/booking_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Booking extends StatefulWidget {
  // final bool upcoming;
  // final bool past;
  // final int id;
  const Booking(  {super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return BookingMobile();
      },
      desktop: (BuildContext context) {
        return BookingWeb();
      },
    );
  }
}
