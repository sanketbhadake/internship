import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kody_test/freamwork/controller/based_controller.dart';
import 'package:kody_test/ui/utils/Widgets/common_container.dart';
import 'package:kody_test/ui/utils/Widgets/common_sizedbox.dart';
import 'package:kody_test/ui/utils/Widgets/common_text.dart';

class ViewAllExcitingOffers extends ConsumerStatefulWidget {
  const ViewAllExcitingOffers({super.key});

  @override
  ConsumerState<ViewAllExcitingOffers> createState() =>
      _ViewAllExcitingOffersState();
}

class _ViewAllExcitingOffersState extends ConsumerState<ViewAllExcitingOffers> {
  @override
  Widget build(BuildContext context) {
    final updatedState = ref.watch(controller);
    return Scaffold(
      appBar: AppBar(
        title: CommonText(text: "Exciting Offers"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
             physics: BouncingScrollPhysics(),
              itemCount: updatedState.welcome?.existingOffers?.length,
              itemBuilder: (context, index) => Column(
                children: [
                  CommonContainer(
                    // color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CommonContainer(
                            height: 85,
                            width: 85,
                            borderRadius: 12,
                            borderColor: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                updatedState
                                        .welcome
                                        ?.existingOffers?[index]
                                        .image ??
                                    '',
                                height: 40,
                                width: 40,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network(
                                    "https://m.media-amazon.com/images/I/71DCZ-I6agL._AC_UF894,1000_QL80_.jpg",
                                    height: 40,
                                    width: 40,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Space.w10,

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                text:
                                    updatedState
                                        .welcome
                                        ?.existingOffers?[index]
                                        .name ??
                                    '',
                                weight: FontWeight.bold,
                              ),
                              CommonText(
                                text:
                                    updatedState
                                        .welcome
                                        ?.existingOffers?[index]
                                        .subtitle ??
                                    '',
                                color: Colors.grey,
                              ),
                              CommonText(
                                text:
                                    updatedState
                                        .welcome
                                        ?.existingOffers?[index]
                                        .offerTitle ??
                                    '',
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
