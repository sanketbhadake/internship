import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/theme/app_assets.dart';
import '../../utils/widgets/common_container.dart';

class CommonCarousel extends StatefulWidget {
  final bool showIndicator;
  const CommonCarousel({super.key, required this.showIndicator});

  @override
  State<CommonCarousel> createState() => _CommonCarouselState();
}
int _currentIndex = 0;
class _CommonCarouselState extends State<CommonCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            CommonContainer(
              borderRadius: 13,

              child: Image.asset(AppAssets.banner, fit: BoxFit.cover),
            ),
            CommonContainer(
              borderRadius: 13,

              child: Image.asset(AppAssets.banner, fit: BoxFit.cover),
            ),
          ],
          options: CarouselOptions(
            // height: 200,
            height: 160,
            viewportFraction: 0.9,
            autoPlay: true,
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: true,
            animateToClosest: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Visibility(
            visible: widget.showIndicator,
            child: SizedBox(height: 10)),
        Visibility(
          visible: widget.showIndicator,
          child: Center(
            child: SmoothPageIndicator(
              controller: PageController(initialPage: _currentIndex),
              count: 2,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.black,
                expansionFactor: 7,
                dotHeight: 6,
              ),
            ),
          ),
        ),
      ],
    );


  }
}
