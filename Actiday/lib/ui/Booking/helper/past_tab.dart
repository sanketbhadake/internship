import 'package:actiday/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:actiday/ui/home/helper/common_card.dart';
import 'package:actiday/ui/Booking/booking%20detail/mobile/booking_detail_mobile.dart';

class PastTab extends StatefulWidget {
  const PastTab({super.key});

  @override
  State<PastTab> createState() => _PastTabState();
}

class _PastTabState extends State<PastTab> {
  final homeData = SplashScreenState.booking?.past;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: homeData?.length ?? 0,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: CommonCard(
          isBooking: true,
          isPast: true,
          image: homeData?[index].image ?? "NA",
          title: homeData?[index].title ?? "NA",
          subTitle: homeData?[index].subTitle?.join(", ") ?? "NA",
          address: homeData?[index].date ?? "NA",
          credit: homeData?[index].credit ?? 0,
          date: homeData?[index].date != null
              ? DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(homeData![index].date!),
                )
              : null,
          bookingOnTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    BookingDetailMobile(id: index, upcoming: false, past: true),
              ),
            );
          },
        ),
      ),
    );
  }
}
