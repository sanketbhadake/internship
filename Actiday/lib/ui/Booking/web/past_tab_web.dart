import 'package:actiday/ui/Booking/booking%20detail/web/booking_detail_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../framework/repository/booking/booking_model.dart';
import '../../home/helper/common_card.dart';
import '../../utils/widgets/common_text.dart';
import '../booking detail/booking_detail.dart';

class PastTabWeb extends StatefulWidget {
  const PastTabWeb({super.key});

  @override
  State<PastTabWeb> createState() => _PastTabWebState();
}

class _PastTabWebState extends State<PastTabWeb> {
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
        crossAxisSpacing: 30,mainAxisExtent: 300,

      ),

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
                builder: (context) =>
                    BookingDetailWeb(upcoming: false, id: index, past: true),
              ),
            );
          },
        ),
      ),
    );
  }
}
