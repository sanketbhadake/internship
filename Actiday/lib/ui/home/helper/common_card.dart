import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/widgets/common_container.dart';
import '../../utils/widgets/common_size.dart';
import '../../utils/widgets/common_text.dart';

class CommonCard extends StatefulWidget {
  final String image;
  final String? title;
  final String? subTitle;
  final String? address;
  final double? rating;
  final bool? showDate;
  final double? distance;
  final bool? isFav;
  final Function()? onTap;

  const CommonCard(  {
    super.key,
    required this.image,
    this.title,
    this.isFav=false,
    this.subTitle,
    this.onTap,
    this.address,
    this.rating,
    this.showDate,
    this.distance,
  });

  @override
  State<CommonCard> createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonContainer(
          height: 250,
          width: context.screenWidth,
          borderRadius: 13,
          color: Colors.grey,
          child: Column(
            children: [
              Image.network(
                widget.image,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/bookings.png", scale: 0.9);
                },
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 20,
          child: GestureDetector(
            onTap:  widget.onTap,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: widget.isFav?? false
                    ? Icon(Icons.favorite, size: 18, color: Colors.red)
                    : Icon(Icons.favorite, size: 18, color: Colors.grey),
              ),
            ),
          ),
        ),
        Positioned(
          top: 130,
          child: CommonContainer(
            height: 120,
            width: context.screenWidth,
            color: Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CommonText(
                        text: widget.title ?? "",
                        fontSize: 14,
                        weight: FontWeight.bold,
                      ),
                      Spacer(),
                      CommonText(
                        text: widget.rating.toString(),

                        fontSize: 14,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(width: 4),
                      SvgPicture.asset("assets/svgs/star.svg", height: 18),
                      SizedBox(width: 20),
                    ],
                  ),
                  CommonText(text: widget.subTitle ?? "", fontSize: 14),

                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey),
                      CommonText(
                        text: widget.address ??  "",
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      CommonText(
                        text:"(${ widget.distance.toString()} Km)" ?? "0",
                        fontSize: 12,
                        color: Colors.grey,
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
