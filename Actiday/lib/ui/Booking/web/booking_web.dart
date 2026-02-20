import 'package:actiday/ui/Booking/web/past_tab_web.dart';
import 'package:actiday/ui/Booking/web/upcoming_tab_web.dart';
import 'package:actiday/ui/utils/widgets/common_footer.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingWeb extends StatefulWidget {
  const BookingWeb({super.key});

  @override
  State<BookingWeb> createState() => _BookingWebState();
}

class _BookingWebState extends State<BookingWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/svgs/home.svg"),
                Icon(Icons.arrow_forward_ios_outlined),
                CommonText(text: "Booking", fontSize: 12),
              ],
            ),
            SizedBox(height: 20),
            CommonText(text: "Booking", fontSize: 14, weight: FontWeight.bold),

            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      padding: EdgeInsets.zero,
                      isScrollable: true,
                      labelColor: Colors.pink,
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey,
                      dividerColor: Colors.transparent,
                      tabs: const [
                        Tab(text: "Upcoming"),
                        Tab(text: "Past"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: TabBarView(
                        children: [UpcomingTabWeb(), PastTabWeb()],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //CommonFooter(),
          ],
        ),
      ),
    );
  }
}
