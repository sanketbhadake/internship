import 'package:doosy_customer/helper/custom_widget.dart';
import 'package:flutter/material.dart';

class ForgotPassVerification extends StatefulWidget {
  const ForgotPassVerification({super.key});

  @override
  State<ForgotPassVerification> createState() => _ForgotPassVerificationState();
}

class _ForgotPassVerificationState extends State<ForgotPassVerification> {
  final slrcolor = Color(0xff00D9AE);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Verification", fontSize: 24,weight: FontWeight.w700,),

            SizedBox(
              height: 30,
            ),
            CustomText(
              text:
                  "We've Sent You A Verification Code On Your Registered Phone Number/Email. Please Verify Phone Number/Email",
              fontSize: 12,
              color: Colors.grey,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpBoxWidget(),
                OtpBoxWidget(),
                OtpBoxWidget(),
                OtpBoxWidget(),



              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CustomText(
                text:
                 "Did not receive a code",
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CustomText(
                text:
                "RESEND",
                fontSize: 14,

              ),
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(text: "DONE")
          ],
        ),
      ),
    );
  }
}
