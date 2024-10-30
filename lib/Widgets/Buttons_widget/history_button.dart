import 'package:flutter/material.dart';

import '../../Colors/colors.dart';
import '../custom_Icon_button.dart';
import '../custom_button.dart';
import '../number_title_row.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomIconButton(
      isallorder: false,
      text: "History",
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
                    "History",
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
                          Card(
                            child: Column(
                              children: [
                                Container(
                                  color: Color(0xFF95A5A5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "20:03 م",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        " Done (#4)",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " Guests: 1",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "20:03 م",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " Cashier: 1",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "Dine In",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width *
                                  0.6,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    OrderRow(
                                      number: 1,
                                      title: "مشاوي",
                                      backgroundColor:
                                      Colors.transparent,
                                      textColor: Colors.grey,
                                    ),
                                    OrderRow(
                                      number: 1,
                                      title: "مشاوي",
                                      backgroundColor:
                                      Colors.transparent,
                                      textColor: Colors.grey,
                                    ),
                                    OrderRow(
                                      number: 1,
                                      title: "مشاوي",
                                      backgroundColor:
                                      Colors.transparent,
                                      textColor: Colors.grey,
                                    ),
                                    OrderRow(
                                      number: 1,
                                      title: "مشاوي",
                                      backgroundColor:
                                      Colors.transparent,
                                      textColor: Colors.grey,
                                    ),
                                    OrderRow(
                                      number: 1,
                                      title: "مشاوي",
                                      backgroundColor:
                                      Colors.transparent,
                                      textColor: Colors.grey,
                                    ),
                                  ],
                                ),
                              )),
                          CustomButton(
                              title: "Recall",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "سلطه خضرا",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  " 5 x",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  " مشاوي",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  " 5 x",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
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
