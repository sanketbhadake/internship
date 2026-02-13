import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../framework/repository/booking/booking_model.dart';
import '../../home/helper/common_card.dart';
import '../../utils/widgets/common_text.dart';

class PastTab extends StatefulWidget {
  const PastTab({super.key});

  @override
  State<PastTab> createState() => _PastTabState();
}

class _PastTabState extends State<PastTab> {
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
      itemCount: welcome?.past?.length ?? 0,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: CommonCard(
          showDate: false,
          image: welcome?.past?[index].image ?? "NA",
          title: welcome?.past?[index].title ?? "NA",
          subTitle: welcome?.past?[index].subTitle?.join(", ") ?? "NA",
          address: welcome?.past?[index].date ?? "NA",
          rating: (welcome?.past?[index].credit ?? "0") as double,
        ),
      ),
    );
  }
}
