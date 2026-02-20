class FavouriteModel {
  final String? image;
  final String? title;
  final String? address;
  final String? distance;
  final int? rating;
  final bool? isLike;
  final int? id;

  FavouriteModel({
    required this.image,
    required this.title,
    required this.id,
    required this.address,
    required this.distance,
    required this.rating,
    required this.isLike,
  });
}
