import 'package:actiday/framework/repository/booking/booking_model.dart';
import 'package:actiday/ui/home/helper/common_card.dart';
import 'package:actiday/ui/utils/widgets/common_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpcomingTab extends StatefulWidget {
  const UpcomingTab({super.key});

  @override
  State<UpcomingTab> createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> {
  Welcome? welcome;


  @override
  void initState() {
    super.initState();
    loadBookingJson();
  }

  Future<void> loadBookingJson() async {
    final String response = await rootBundle.loadString(
      'assets/json/bookings.json',
    );

    final data = welcomeFromJson(response);

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
          showDate: false,
          image: welcome?.upcoming?[index].image ?? "NA",
          title: welcome?.upcoming?[index].title ?? "NA",
          subTitle: welcome?.upcoming?[index].subTitle?.join(", ") ?? "NA",
          address: welcome?.upcoming?[index].date ?? "NA",
          rating: (welcome?.upcoming?[index].credit ?? "0") as double,
        ),
      ),
    );
  }
}
