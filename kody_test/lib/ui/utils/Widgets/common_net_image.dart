import 'package:flutter/material.dart';

class CommonNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const CommonNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          "https://img.freepik.com/free-vector/colorful-round-tasty-pizza_1284-10219.jpg",
          height: height,
          width: width,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
