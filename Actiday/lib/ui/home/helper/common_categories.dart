import 'package:flutter/material.dart';
import 'package:actiday/ui/utils/widgets/common_container.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';

class CommonCategories extends StatefulWidget {
  final double? height;
  final double? width;
  final String? image;
  final String? title;

  const CommonCategories({
    super.key,
    this.height,
    this.width,
    this.image,
    this.title,
  });

  @override
  State<CommonCategories> createState() => _CommonCategoriesState();
}

class _CommonCategoriesState extends State<CommonCategories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: CommonContainer(
        height: widget.height,
        width: widget.width,
        borderRadius: 13,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.image ?? "",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: SizedBox(
                width: 80,
                child: CommonText(
                  text: widget.title ?? "NA",
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
