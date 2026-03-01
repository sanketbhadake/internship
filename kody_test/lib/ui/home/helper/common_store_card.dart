// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kody_test/ui/utils/Widgets/common_container.dart';
// import 'package:kody_test/ui/utils/Widgets/common_text.dart';
// import 'package:kody_test/ui/utils/theme/app_colors.dart';
//
// class CommonStoreCard extends StatefulWidget {
//   final String? image;
//
//   const CommonStoreCard({super.key,this.image});
//
//   @override
//   State<CommonStoreCard> createState() => _CommonStoreCardState();
// }
//
// class _CommonStoreCardState extends State<CommonStoreCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15.0),
//       child: Stack(
//         children: [
//           CommonContainer(
//             // shadow: true,
//             // color: Colors.white,
//             borderRadius: 14,
//             child: Column(
//               children: [
//                 CommonContainer(
//                   height: 130,
//                   borderRadius: 14,
//                   width: double.infinity,
//                   color: Colors.white,
//                   child: Image.network(
//                    widget.image?? '',
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Image.network(
//                         "https://m.media-amazon.com/images/I/71DCZ-I6agL._AC_UF894,1000_QL80_.jpg",
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       );
//                     },
//                   ),
//                 ),
//                 CommonContainer(
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             CommonText(
//                               text: item?.stores?[index].name ?? '',
//                               weight: FontWeight.w600,
//                             ),
//                             const Spacer(),
//                             CommonText(
//                               text:
//                                   "Free delivery up to ${item?.stores?[index].freeDeliveryKm ?? ''} km",
//                               color: AppColors.clrGreen,
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset("assets/svgs/svg_star.svg"),
//                             const SizedBox(width: 5),
//                             CommonText(text: item?.stores?[index].rating ?? ''),
//                             const SizedBox(width: 3),
//                             CommonText(
//                               text: "(${item?.stores?[index].review ?? ''}+)",
//                               color: Colors.grey,
//                             ),
//                             const Spacer(),
//
//                             SvgPicture.asset("assets/svgs/svg_timer.svg"),
//                             const SizedBox(width: 3),
//
//                             CommonText(
//                               text: item?.stores?[index].deliveryTime ?? '',
//                               color: Colors.grey,
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             const CommonText(
//                               text: "Min. order ",
//                               color: Colors.grey,
//                             ),
//                             CommonText(
//                               text:
//                                   "${item?.stores?[index].minOrder ?? ''} INR",
//                             ),
//
//                             const Spacer(),
//
//                             SvgPicture.asset("assets/svgs/svg_google_map.svg"),
//                             const SizedBox(width: 3),
//                             CommonText(
//                               text: item?.stores?[index].distance ?? '',
//                               color: Colors.grey,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 30,
//
//                   decoration: const BoxDecoration(
//                     color: AppColors.clrGreen,
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(12),
//                       bottomLeft: Radius.circular(12),
//                     ),
//                   ),
//
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Row(
//                       children: [
//                         CommonText(
//                           text: item?.stores?[index].offer?.title ?? '',
//                           color: Colors.white,
//                           weight: FontWeight.w600,
//                           overFlow: true,
//                         ),
//                         const Spacer(),
//                         CommonText(
//                           text: item?.stores?[index].offer?.code ?? '',
//                           color: Colors.white,
//                           weight: FontWeight.w600,
//                           overFlow: true,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: -2,
//             right: 20,
//             child: SvgPicture.asset("assets/svgs/svg_tag.svg"),
//           ),
//           Positioned(
//             top: 15,
//             left: 10,
//             child: CircleAvatar(
//               radius: 35,
//               backgroundColor: Colors.grey,
//               backgroundImage: NetworkImage(item?.stores?[index].banner ?? ''),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
