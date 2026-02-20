import 'package:actiday/framework/repository/booking/booking_model.dart';
import 'package:actiday/ui/Booking/booking%20detail/web/booking_detail_web.dart';
import 'package:actiday/ui/home/helper/common_card.dart';
import 'package:actiday/ui/utils/widgets/common_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../booking detail/booking_detail.dart';

class UpcomingTabWeb extends StatefulWidget {
  const UpcomingTabWeb({super.key});

  @override
  State<UpcomingTabWeb> createState() => _UpcomingTabWebState();
}

class _UpcomingTabWebState extends State<UpcomingTabWeb> {
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        crossAxisSpacing: 30,
        mainAxisExtent: 300
      ),
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
                    BookingDetailWeb(upcoming: true, id: index, past: false),
              ),
            );
          },
        ),
      ),
    );
  }
}
