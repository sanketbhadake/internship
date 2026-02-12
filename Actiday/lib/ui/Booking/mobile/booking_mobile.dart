import 'package:flutter/material.dart';

import '../../utils/widgets/common_text.dart';


class BookingMobile extends StatefulWidget {
  const BookingMobile({super.key});

  @override
  State<BookingMobile> createState() => _BookingMobileState();
}

class _BookingMobileState extends State<BookingMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonText(text: "Booking", fontSize: 15),
    );
  }
}
