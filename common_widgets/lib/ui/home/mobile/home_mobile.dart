import 'package:common_widgets/ui/utils/widgets/common_bottomsheet.dart';
import 'package:common_widgets/ui/utils/widgets/common_button.dart';
import 'package:common_widgets/ui/utils/widgets/common_sizedbox.dart';
import 'package:common_widgets/ui/utils/widgets/common_text.dart';
import 'package:common_widgets/ui/utils/widgets/custom_textform.dart';
import 'package:flutter/material.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => HomeMobileState();
}

class HomeMobileState extends State<HomeMobile> {
  final TextEditingController user = TextEditingController();
  final TextEditingController email = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CommonTextFormField(
              controller: user,
              label: "Name",
              validator: (valid) {
                if (valid == null || valid.trim().isEmpty) {
                  return 'Invalid';
                }
                return null;
              },
            ),
            Space.h20,
            CommonTextFormField(
              controller: email,
              label: "Email",
              validator: (valid) {
                if (valid == null || valid.trim().isEmpty) {
                  return 'Invalid';
                }
              },
            ),
            Space.h20,
            CommonButton(
              width: MediaQuery.of(context).size.width * 0.7,
              title: "Enter",
              txtColor: Colors.white,
              borderRadius: 20,
              onTap: () {
                CommonBottomSheet.show(
                  context,
                  child: Column(
                    children: [
                      CommonText(text: "Name"),
                      CommonTextFormField(label: "Enter the name"),
                      Space.h20,

                      CommonButton(
                        width: MediaQuery.of(context).size.width * 0.5,
                        title: "submit",
                        onTap: () {},
                        color: Colors.green,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
