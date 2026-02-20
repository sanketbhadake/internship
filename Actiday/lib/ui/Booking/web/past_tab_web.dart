import 'package:actiday/ui/Booking/booking%20detail/web/booking_detail_web.dart';
import 'package:actiday/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:actiday/ui/home/helper/common_card.dart';

class PastTabWeb extends StatefulWidget {
  const PastTabWeb({super.key});

  @override
  State<PastTabWeb> createState() => _PastTabWebState();
}

class _PastTabWebState extends State<PastTabWeb> {
  final homeData = SplashScreenState.booking?.past;

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
                    BookingDetailWeb(upcoming: false, id: index, past: true),
              ),
            );
          },
        ),
      ),
    );
  }
}
