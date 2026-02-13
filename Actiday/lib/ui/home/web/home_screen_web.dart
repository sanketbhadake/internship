import 'package:actiday/ui/home/helper/common_carousel.dart';
import 'package:actiday/ui/home/helper/top_classes.dart';
import 'package:actiday/ui/utils/widgets/common_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../framework/repository/booking/booking_model.dart';
import '../../utils/widgets/common_container.dart';
import '../../utils/widgets/common_footer.dart';
import '../../utils/widgets/common_text.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {


  Welcome? welcome;

  @override
  void initState() {
    super.initState();
    loadBookingJson();
  }

  Future<void> loadBookingJson() async {
    final String response = await rootBundle.loadString(
      'assets/json/home.json',
    );

    final data = welcomeFromJson(response);

    setState(() {
      welcome = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonCarousel(showIndicator: true),
                  SizedBox(height: 20),
                  CommonText(
                    text: "Royal Peace Spa",
                    weight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  CommonText(
                    text:
                        "Relax and rejuvenate with the traditional Thai dry therapy Relax and rejuvenate with the",
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  CommonText(
                    text: "Catagories",
                    weight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                          SizedBox(
                            height: 180,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 15.0),
                                        child: CommonContainer(
                                          height: 170,
                                          width: context.screenWidth * 0.4,
                                          borderRadius: 13,
                                          color: Colors.blue,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0,
                                              vertical: 30,
                                            ),
                                            child: CommonText(
                                              text: "Fitness",
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 70,
                                        left: 300,
                                        child: Image.asset(
                                          "assets/images/spa.png",
                                          scale: 0.9,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),



                    ],
                  ),
                  SizedBox(height: 20),
                  CommonText(
                    text: "Top Classes",
                    weight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 30,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) => TopClasses(),
                  ),
                ],
              ),
            ),
            CommonFooter(),
          ],
        ),
      ),
    );
  }
}
