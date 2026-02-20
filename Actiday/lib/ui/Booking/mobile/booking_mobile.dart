import 'package:actiday/ui/login/login_screen.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
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
  void showAlertBoxModel() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: CommonContainer(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CommonText(text: "Are you sure to Logout", fontSize: 16),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CommonContainer(
                        height: 30,
                        width: 80,
                        borderRadius: 10,
                        borderColor: Colors.black,

                        child: Center(
                          child: CommonText(
                            text: "NO",
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const CommonContainer(
                        height: 30,
                        width: 80,
                        borderRadius: 10,
                        color: Colors.red,
                        child: Center(
                          child: CommonText(
                            text: "YES",
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 80),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Future.delayed(const Duration(milliseconds: 50), () {
                  showAlertBoxModel();
                });
              },
              child: const ListTile(
                title: CommonText(text: "Logout", fontSize: 14),
                leading: Icon(Icons.logout_outlined),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: SvgPicture.asset(AppAssets.category),
            ),
          ),
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
