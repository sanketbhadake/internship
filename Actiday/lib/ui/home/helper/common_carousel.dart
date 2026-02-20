import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';

class CommonCarousel extends StatefulWidget {
  final bool showIndicator;
  final double? height;

  const CommonCarousel({super.key, this.height, required this.showIndicator});

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
              height: widget.height,
              borderRadius: 13,

              child: Image.asset(
                AppAssets.banner,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            CommonContainer(
              height: widget.height,
              borderRadius: 13,

              child: Image.asset(
                AppAssets.banner,
                width: double.infinity,

                fit: BoxFit.fill,
              ),
            ),
          ],
          options: CarouselOptions(
            // height: 200,
            height: widget.height,
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
        Visibility(visible: widget.showIndicator, child: SizedBox(height: 10)),
        Visibility(
          visible: widget.showIndicator,
          child: Center(
            child: SmoothPageIndicator(
              controller: PageController(initialPage: _currentIndex),
              count: 2,
              effect: const ExpandingDotsEffect(
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
