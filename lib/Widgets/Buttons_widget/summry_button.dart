import 'package:flutter/material.dart';

import '../../Colors/colors.dart';
import '../custom_Icon_button.dart';
import '../custom_button.dart';
import '../item_row.dart';
import '../number_title_row.dart';


class SummryButton extends StatelessWidget {
  final ValueNotifier<int> dineInCount;
  final ValueNotifier<int> pickupCount;
  final ValueNotifier<int> deliveryCount;
  final ValueNotifier<int> driveThruCount;

  const SummryButton({super.key, required this.dineInCount, required this.pickupCount, required this.deliveryCount, required this.driveThruCount});

  @override
  Widget build(BuildContext context) {
    return   CustomIconButton(
      isallorder: false,
      text: "Summary",
      menuItems: [
        Container(
          height: MediaQuery.of(context).size.height * 0.76,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            children: [
              Container(
                color: AppColor.secondaryColor,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Summary",
                    style: TextStyle(
                        color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          Container(
                            color: AppColor.x,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Summary",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.grey.shade200,
                            height: MediaQuery.of(context).size.height *
                                0.05,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0,right: 10),
                              child: Align(

                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "ORDER STATUS",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          NumberTitleRow(number: 4, title: "All"),
                          NumberTitleRow(number: 0, title: "Denyed"),
                          NumberTitleRow(number: 0, title: "CNCELED"),
                          Container(
                            color: Colors.grey.shade200,
                            height: MediaQuery.of(context).size.height *
                                0.04,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,right: 10),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "ORDER TYPE",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: dineInCount,
                            builder: (context, value, child) => NumberTitleRow(number: value, title: "Dine in"),
                          ),
                          ValueListenableBuilder(
                            valueListenable: pickupCount,
                            builder: (context, value, child) => NumberTitleRow(number: value, title: "Pick up"),
                          ),
                          ValueListenableBuilder(
                            valueListenable: deliveryCount,
                            builder: (context, value, child) => NumberTitleRow(number: value, title: "Delivery"),
                          ),
                          ValueListenableBuilder(
                            valueListenable: driveThruCount,
                            builder: (context, value, child) => NumberTitleRow(number: value, title: "Drive Thru"),
                          ),

                          // Spacer(),
                          CustomButton(
                              title: "Bump All",
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      )),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ItemRow(title: "مشاوي", quantity: 5)  ,
                            ItemRow(title: "سلطه خضرا", quantity: 4)
                          ],
                        ),
                      )),
                ],
              )
              // Additional content here
            ],
          ),
        ),
      ],
    );
  }
}