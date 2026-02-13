import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/theme/app_assets.dart';
import '../../utils/widgets/common_text.dart';
import '../helper/past_tab.dart';
import '../helper/upcoming_tab.dart';

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
        title: CommonText(text: "My Booking", fontSize: 14),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.pink,
                indicatorColor: Colors.pink,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Upcoming"),
                  Tab(text: "Past,"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    UpcomingTab(),
                    PastTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
