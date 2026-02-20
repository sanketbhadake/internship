import 'package:actiday/ui/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';

class CommonCard extends StatefulWidget {
  final String image;
  final String? title;
  final String? subTitle;
  final String? address;
  final int? rating;
  final bool isBooking;
  final double? distance;
  final DateTime? date;
  final bool? isFav;
  final int? credit;
  final bool isPast;
  final Function()? onTap;
  final Function()? bookingOnTap;

  const CommonCard({
    super.key,
    required this.image,
    this.title,
    this.subTitle,
    this.address,
    this.rating,
    this.distance,
    this.date,
    this.credit,
    this.onTap,
    this.bookingOnTap,
    this.isFav = false,
    this.isBooking = false,
    this.isPast = false,
  });

  @override
  State<CommonCard> createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background Image Container
        CommonContainer(
          height: 260,
          width: double.infinity,
          borderRadius: 13,

          child: Column(
            children: [
              Image.network(
                widget.image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AppAssets.booking,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ],
          ),
        ),

        /// Favorite Icon
        if (!widget.isBooking)
          Positioned(
            top: 15,
            right: 25,
            child: GestureDetector(
              onTap: widget.onTap,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: widget.isFav ?? false
                      ? const Icon(Icons.favorite, size: 18, color: Colors.red)
                      : const Icon(
                          Icons.favorite,
                          size: 18,
                          color: Colors.grey,
                        ),
                ),
              ),
            ),
          ),

        /// Bottom Information Card
        Positioned(
          top: 155,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: widget.isBooking
                    ? const Color(0xffD4D4D4)
                    : Colors.transparent,
              ),
              color: widget.isBooking
                  ? const Color(0xffFFFFFF)
                  : const Color(0xFFF8F8F8),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(13),
                bottomRight: Radius.circular(13),
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title + Rating / Credit
                  Row(
                    children: [
                      CommonText(
                        text: widget.title ?? "",
                        fontSize: 14,
                        weight: FontWeight.bold,
                      ),
                      const Spacer(),

                      /// Booking Mode
                      widget.isBooking
                          ? Row(
                              children: [
                                CommonText(
                                  text: "${widget.credit} Credit",
                                  fontSize: 14,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            )
                          /// Normal Mode
                          : Row(
                              children: [
                                CommonText(
                                  text: widget.rating.toString(),
                                  fontSize: 14,
                                  weight: FontWeight.bold,
                                ),
                                const SizedBox(width: 4),
                                SvgPicture.asset(AppAssets.star, height: 18),
                                const SizedBox(width: 20),
                              ],
                            ),
                    ],
                  ),

                  /// Subtitle
                  Flexible(
                    child: CommonText(
                      text: widget.subTitle ?? "",
                      fontSize: 11,
                    ),
                  ),
                  (widget.isBooking)
                      ? const Divider(thickness: 0.5)
                      : const SizedBox(height: 5),

                  /// Bottom Row
                  widget.isBooking
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: CommonText(
                                text: widget.date != null
                                    ? DateFormat(
                                        'dd MMM yyyy, hh:mm a',
                                      ).format(widget.date!)
                                    : "",
                                fontSize: 12,
                              ),
                            ),

                            GestureDetector(
                              onTap: widget.bookingOnTap,
                              child: CommonContainer(
                                borderRadius: 14,
                                height: 25,
                                width: 75,
                                borderColor: const Color(0xffF048C6),
                                child: Center(
                                  child: CommonText(
                                    text: widget.isPast ? "Continue" : "Book",
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.grey),
                            Flexible(
                              child: CommonText(
                                text:
                                    "${widget.address} (${widget.distance.toString()} Km)",
                                fontSize: 12,
                                color: Colors.grey,
                              ),
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
