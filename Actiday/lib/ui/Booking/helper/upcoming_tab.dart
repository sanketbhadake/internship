import 'package:actiday/framework/repository/booking/booking_model.dart';
import 'package:actiday/ui/Booking/booking%20detail/mobile/booking_detail_mobile.dart';

import 'package:actiday/ui/home/helper/common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../booking detail/booking_detail.dart';

class UpcomingTab extends StatefulWidget {
  const UpcomingTab({super.key});

  @override
  State<UpcomingTab> createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> {
  WelcomeBook? welcome;

  @override
  void initState() {
    super.initState();
    loadBookingJson();
  }

  Future<void> loadBookingJson() async {
    final String response = await rootBundle.loadString(
      'assets/json/bookings.json',
    );

    final data = welcomeFromBookJson(response);

    setState(() {
      welcome = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: welcome?.upcoming?.length ?? 0,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: CommonCard(
          isBooking: true,
          image: welcome?.upcoming?[index].image ?? "NA",
          title: welcome?.upcoming?[index].title ?? "NA",
          subTitle: welcome?.upcoming?[index].subTitle?.join(", ") ?? "NA",
          address: welcome?.upcoming?[index].date ?? "NA",
          credit: welcome?.upcoming?[index].credit ?? 0,
          date: welcome?.upcoming?[index].date != null
              ? DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(welcome!.upcoming![index].date!),
                )
              : null,
          bookingOnTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    BookingDetailMobile(upcoming: true, id: index, past: false),
              ),
            );
          },
        ),
      ),
    );
  }
}
