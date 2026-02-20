import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:actiday/ui/splash/splash_screen.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';

class BookingDetailMobile extends StatefulWidget {
  final bool upcoming;
  final bool past;
  final int id;

  const BookingDetailMobile({
    super.key,
    this.upcoming = false,
    this.past = false,
    this.id = 0,
  });

  @override
  State<BookingDetailMobile> createState() => _BookingDetailMobileState();
}

class _BookingDetailMobileState extends State<BookingDetailMobile> {
  late int index = widget.id;
  late final item = widget.upcoming
      ? SplashScreenState.booking?.upcoming![index]
      : SplashScreenState.booking?.past![index];

  String ratingText = '';
  bool isClicked = false;
  int rateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),

        leadingWidth: 50,
        title: const CommonText(text: "Booking Details", fontSize: 14),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CommonContainer(
                    height: 250,
                    color: const Color(0xffFFFFFF),
                    borderRadius: 16,
                    shadow: true,
                    child: Column(
                      children: [
                        CommonContainer(
                          height: 71,
                          color: const Color(0xffFFFFFF),
                          child: Row(
                            children: [
                              const SizedBox(width: 90),
                              Expanded(
                                child: ListTile(
                                  title: CommonText(
                                    text: item?.title ?? '',
                                    fontSize: 14,
                                  ),
                                  subtitle: Row(
                                    children: [
                                      SvgPicture.asset(AppAssets.locationSvg),
                                      CommonText(
                                        text: item?.address ?? '',
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CommonContainer(
                          height: 34,
                          color: const Color(0xffF3F3F3),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 90),
                                CommonText(
                                  text: item?.rating.toString() ?? '',
                                  fontSize: 14,
                                ),
                                const SizedBox(width: 5),
                                const Icon(Icons.star, size: 16),
                                const Spacer(),
                                CommonContainer(
                                  borderRadius: 14,
                                  height: 23,
                                  width: 75,
                                  borderColor: const Color(0xffF048C6),
                                  child: Center(
                                    child: CommonText(
                                      text: widget.upcoming
                                          ? "Book"
                                          : "continue",
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CommonContainer(
                          height: 142,
                          color: const Color(0xffFFFFFF),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 15,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CommonText(
                                      text: item?.category ?? '',
                                      fontSize: 12,
                                    ),
                                    const Spacer(),
                                    CommonText(
                                      text: "${item?.credit} Credit",
                                      weight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.watch_later_outlined,
                                      size: 16,
                                      color: Color(0xff232323),
                                    ),
                                    const SizedBox(width: 5),
                                    CommonText(
                                      text: item?.time ?? '',

                                      color: const Color(0xff232323),
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),

                                Row(
                                  children: [
                                    const CommonText(
                                      text: "Specialist",
                                      fontSize: 12,
                                    ),
                                    const Spacer(),
                                    CommonText(
                                      text: item?.specialist ?? '',
                                      weight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),

                                Row(
                                  children: [
                                    const CommonText(
                                      text: "Timeslot",
                                      fontSize: 12,
                                    ),
                                    const Spacer(),
                                    CommonText(
                                      text: item?.timeSlot ?? '',
                                      weight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),

                                Row(
                                  children: [
                                    const CommonText(
                                      text: "Booking ID",
                                      fontSize: 12,
                                    ),
                                    const Spacer(),
                                    CommonText(
                                      text: item?.bookingId ?? '',
                                      weight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: CommonContainer(
                      height: 82,
                      width: 82,
                      borderRadius: 13,
                      child: Image.asset(AppAssets.bookingDetail),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CommonText(
                text: "Payment Summary",
                weight: FontWeight.bold,
                fontSize: 14,
              ),
              const SizedBox(height: 20),
              CommonContainer(
                height: 95,
                color: const Color(0xffFFFFFF),
                borderRadius: 13,
                shadow: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CommonText(text: "Booking", fontSize: 12),
                          const Spacer(),
                          CommonText(
                            text: "${item?.credit} Credit",
                            weight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Divider(),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const CommonText(text: "Order Total", fontSize: 12),
                          const Spacer(),
                          CommonText(
                            text: "${item?.credit} Credit",
                            weight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Visibility(
                visible: widget.past,
                child: CommonContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonText(
                        text: "Rate Us",
                        weight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            final rating = index + 1;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  rateIndex = rating;

                                  switch (rating) {
                                    case 1:
                                      ratingText = "Poor";
                                      break;
                                    case 2:
                                      ratingText = "Average";
                                      break;
                                    case 3:
                                      ratingText = "Good";
                                      break;
                                    case 4:
                                      ratingText = "Very Good";
                                      break;
                                    case 5:
                                      ratingText = "Excellent";
                                      break;
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  CommonContainer(
                                    height: 36,
                                    width: 44,
                                    borderRadius: 13,
                                    borderColor: rateIndex == rating
                                        ? Colors.pink
                                        : Colors.grey,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CommonText(
                                          text: '$rating',
                                          fontSize: 13,
                                        ),
                                        SvgPicture.asset(AppAssets.star),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            );
                          }),
                          CommonText(
                            text: ratingText,
                            fontSize: 14,
                            color: Colors.pink,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      const CommonText(
                        text: "Write Your Reviews",
                        weight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      const TextField(),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Visibility(
                visible: widget.upcoming,
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: CommonContainer(
                    height: 50,
                    borderRadius: 25,
                    borderColor: Color(0xff3A4161),
                    child: Center(
                      child: CommonText(text: "Cancel Booking", fontSize: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: widget.past,
                child: const CommonContainer(
                  height: 50,
                  borderRadius: 25,
                  gradient: true,
                  child: Center(
                    child: CommonText(
                      text: "Submit",
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
