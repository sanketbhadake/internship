
import 'package:flutter/material.dart';

import 'common_size.dart';
import 'common_text.dart';

class CommonFooter extends StatefulWidget {
  const CommonFooter({super.key});

  @override
  State<CommonFooter> createState() => _CommonFooterState();
}

class _CommonFooterState extends State<CommonFooter> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 110,
        width: context.screenWidth,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CommonText(text: "copyright © 2020-22 Dreamplug Technologies Pvt Ltd.", fontSize: 12,color: Colors.white,),
            CommonText(text: "privacy policy | terms and conditions | returns and refund", fontSize: 12,color: Colors.white,),
          ],
        ),
      );
  }
}
