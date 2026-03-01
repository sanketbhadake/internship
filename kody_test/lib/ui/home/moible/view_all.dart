import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kody_test/freamwork/controller/based_controller.dart';
import 'package:kody_test/ui/utils/Widgets/common_container.dart';
import 'package:kody_test/ui/utils/Widgets/common_text.dart';
import 'package:kody_test/ui/utils/theme/app_colors.dart';

class ViewAll extends ConsumerStatefulWidget {
  const ViewAll({super.key});

  @override
  ConsumerState<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends ConsumerState<ViewAll> {
  @override
  Widget build(BuildContext context) {
    final updateState = ref.watch(controller);
    return Scaffold(
      appBar: AppBar(
        title: CommonText(text: "All Stores",weight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
        
                physics: const NeverScrollableScrollPhysics(),
                itemCount: updateState.welcome?.stores?.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Stack(
                    children: [
                      CommonContainer(
                        // shadow: true,
                        // color: Colors.white,
                        borderRadius: 14,
                        child: Column(
                          children: [
                            CommonContainer(
                              height: 130,
                              borderRadius: 14,
                              width: double.infinity,
                              color: Colors.white,
                              child: Image.network(
                                updateState.welcome?.stores?[index].banner ?? '',
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network(
                                    "https://m.media-amazon.com/images/I/71DCZ-I6agL._AC_UF894,1000_QL80_.jpg",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            CommonContainer(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CommonText(
                                          text:
                                              updateState
                                                  .welcome
                                                  ?.stores?[index]
                                                  .name ??
                                              '',
                                          weight: FontWeight.w600,
                                        ),
                                        const Spacer(),
                                        CommonText(
                                          text:
                                              "Free delivery up to ${updateState.welcome?.stores?[index].freeDeliveryKm ?? ''} km",
                                          color: AppColors.clrGreen,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svgs/svg_star.svg",
                                        ),
                                        const SizedBox(width: 5),
                                        CommonText(
                                          text:
                                              updateState
                                                  .welcome
                                                  ?.stores?[index]
                                                  .rating ??
                                              '',
                                        ),
                                        const SizedBox(width: 3),
                                        CommonText(
                                          text:
                                              "(${updateState.welcome?.stores?[index].review ?? ''}+)",
                                          color: Colors.grey,
                                        ),
                                        const Spacer(),
        
                                        SvgPicture.asset(
                                          "assets/svgs/svg_timer.svg",
                                        ),
                                        const SizedBox(width: 3),
        
                                        CommonText(
                                          text:
                                              updateState
                                                  .welcome
                                                  ?.stores?[index]
                                                  .deliveryTime ??
                                              '',
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const CommonText(
                                          text: "Min. order ",
                                          color: Colors.grey,
                                        ),
                                        CommonText(
                                          text:
                                              "${updateState.welcome?.stores?[index].minOrder ?? ''} INR",
                                        ),
        
                                        const Spacer(),
        
                                        SvgPicture.asset(
                                          "assets/svgs/svg_google_map.svg",
                                        ),
                                        const SizedBox(width: 3),
                                        CommonText(
                                          text:
                                              updateState
                                                  .welcome
                                                  ?.stores?[index]
                                                  .distance ??
                                              '',
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
        
                              decoration: const BoxDecoration(
                                color: AppColors.clrGreen,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                              ),
        
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    CommonText(
                                      text:
                                          updateState
                                              .welcome
                                              ?.stores?[index]
                                              .offer
                                              ?.title ??
                                          '',
                                      color: Colors.white,
                                      weight: FontWeight.w600,
                                      overFlow: true,
                                    ),
                                    const Spacer(),
                                    CommonText(
                                      text:
                                          updateState
                                              .welcome
                                              ?.stores?[index]
                                              .offer
                                              ?.code ??
                                          '',
                                      color: Colors.white,
                                      weight: FontWeight.w600,
                                      overFlow: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -2,
                        right: 20,
                        child: SvgPicture.asset("assets/svgs/svg_tag.svg"),
                      ),
                      Positioned(
                        top: 15,
                        left: 10,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                            updateState.welcome?.stores?[index].banner ?? '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
