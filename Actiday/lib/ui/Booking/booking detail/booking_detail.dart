import 'package:actiday/ui/Booking/booking%20detail/mobile/booking_detail_mobile.dart';
import 'package:actiday/ui/Booking/booking%20detail/web/booking_detail_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({super.key});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return BookingDetailMobile();
      },
      desktop: (BuildContext context) {
        return BookingDetailWeb();
      },
    );
  }
}
