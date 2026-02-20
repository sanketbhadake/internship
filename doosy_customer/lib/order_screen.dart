import 'package:doosy_customer/helper/custom_widget.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText(
                text: "My orders",
                fontSize: 22,
                weight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              SizedBox(
          
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context,index)=> Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0.2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                          color: Colors.grey,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset("assets/orders.png"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Delight Cafe", fontSize: 16),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Order ID: 2658746',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                SizedBox(width: 70),
                                // Spacer(),
                                CustomText(text: 'Placed', fontSize: 12),
                              ],
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Order Date : 25-06-2020',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                SizedBox(width: 30),
                                CustomText(text: 'Time : 10:30 AM', fontSize: 12),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
