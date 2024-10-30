import 'package:cashier_app/Colors/colors.dart';
import 'package:flutter/material.dart';

import 'custom_Icon_button.dart';
import 'custom_button.dart';
import 'number_title_row.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.8,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 9,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.25,
                child: Column(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Container(
                            color: AppColor.x,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "20:03 م",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  " Done (#4)",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " Guests: 1",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Text(
                                "20:03 م",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " Cashier: 1",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.6,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              OrderRow(
                                number: 1,
                                title: "مشاوي",
                                backgroundColor: Colors.transparent,
                                textColor: Colors.grey,
                              ),
                              OrderRow(
                                number: 1,
                                title: "مشاوي",
                                backgroundColor: Colors.transparent,
                                textColor: Colors.grey,
                              ),
                              OrderRow(
                                number: 1,
                                title: "مشاوي",
                                backgroundColor: Colors.transparent,
                                textColor: Colors.grey,
                              ),
                              OrderRow(
                                number: 1,
                                title: "مشاوي",
                                backgroundColor: Colors.transparent,
                                textColor: Colors.grey,
                              ),
                              OrderRow(
                                number: 1,
                                title: "مشاوي",
                                backgroundColor: Colors.transparent,
                                textColor: Colors.grey,
                              ),
                              OrderRow(
                                number: 1,
                                title: "مشاوي",
                                backgroundColor: Colors.transparent,
                                textColor: Colors.grey,
                              ),
                              OrderRow(
                                number: 1,
                                title: "مشاوي",
                                backgroundColor: Colors.transparent,
                                textColor: Colors.grey,
                              ),
                            ],
                          ),
                        )),
                    Spacer(),
                    CustomButton(title: "Bump", onPressed: () {})
                  ],
                ),
              )),
    );
  }
}
