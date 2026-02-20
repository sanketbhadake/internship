import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:actiday/ui/Booking/helper/past_tab.dart';
import 'package:actiday/ui/Booking/helper/upcoming_tab.dart';

class BookingMobile extends StatefulWidget {
  const BookingMobile({super.key});

  @override
  State<BookingMobile> createState() => _BookingMobileState();
}

class _BookingMobileState extends State<BookingMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SvgPicture.asset(AppAssets.category),
        ),
        leadingWidth: 50,
        title: const CommonText(text: "My Booking", fontSize: 14),
        centerTitle: true,
      ),
      body: const DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.pink,
                indicatorColor: Colors.pink,
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(text: "Upcoming"),
                  Tab(text: "Past"),
                ],
              ),
              SizedBox(height: 20),

              Expanded(child: TabBarView(children: [UpcomingTab(), PastTab()])),
            ],
          ),
        ),
      ),
    );
  }
}
