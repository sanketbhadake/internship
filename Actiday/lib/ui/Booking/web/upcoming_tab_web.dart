import 'package:actiday/ui/Booking/booking%20detail/web/booking_detail_web.dart';
import 'package:actiday/ui/home/helper/common_card.dart';
import 'package:actiday/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class UpcomingTabWeb extends StatefulWidget {
  const UpcomingTabWeb({super.key});

  @override
  State<UpcomingTabWeb> createState() => _UpcomingTabWebState();
}

class _UpcomingTabWebState extends State<UpcomingTabWeb> {
  final homeData = SplashScreenState.booking?.upcoming;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        crossAxisSpacing: 30,
        mainAxisExtent: 300,
      ),
      shrinkWrap: true,
      itemCount: homeData?.length ?? 0,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: CommonCard(
          isBooking: true,

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
                    BookingDetailWeb(upcoming: true, id: index, past: false),
              ),
            );
          },
        ),
      ),
    );
  }
}
