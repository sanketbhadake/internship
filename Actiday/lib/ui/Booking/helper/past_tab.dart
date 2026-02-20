import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../framework/repository/booking/booking_model.dart';
import '../../home/helper/common_card.dart';

import '../booking detail/mobile/booking_detail_mobile.dart';

class PastTab extends StatefulWidget {
  const PastTab({super.key});

  @override
  State<PastTab> createState() => _PastTabState();
}

class _PastTabState extends State<PastTab> {
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
      itemCount: welcome?.past?.length ?? 0,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: CommonCard(
          isBooking: true,
          isPast: true,
          image: welcome?.past?[index].image ?? "NA",
          title: welcome?.past?[index].title ?? "NA",
          subTitle: welcome?.past?[index].subTitle?.join(", ") ?? "NA",
          address: welcome?.past?[index].date ?? "NA",
          credit: welcome?.past?[index].credit ?? 0,
          date: welcome?.past?[index].date != null
              ? DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(welcome!.past![index].date!),
                )
              : null,
          bookingOnTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BookingDetailMobile(
                  id:index ,
                  upcoming: false,
                  past: true,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
