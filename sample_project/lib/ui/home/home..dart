import 'package:flutter/material.dart';
import 'package:sample_project/ui/utils/widgets/common_bottomsheet.dart';
import 'package:sample_project/ui/utils/widgets/common_button.dart';
import 'package:sample_project/ui/utils/widgets/common_sizedbox.dart';

import '../utils/widgets/common_dialog.dart' show CommonDialogDialog;
import '../utils/widgets/common_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CommonText(text: "sample project created"),
            CommonButton(
              height: 40,
              borderRadius: 12,
              txtColor: Colors.white,
              title: "open bottomsheet",
              onTap: () {
                CommonBottomSheet.show(
                  context,
                  child: CommonText(text: "BottomSheet Open successfully"),
                );
              },
            ),
            Space.h20,
            CommonButton(
              title: "Open dialog",
              onTap: () {
                CommonDialogDialog.showConfirmDialog(
                  context,
                  body: CommonText(text: "Dialog open successfully"),
                );
              },
            ),
            Radio<int>(
              value: 1,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
            Text("Option 1"),
            Radio<int>(
              value: 2,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
            Text("Option 2"),
            Radio<int>(
              value: 3,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
            Text("Option 3"),
          ],
        ),
      ),
    );
  }
}
