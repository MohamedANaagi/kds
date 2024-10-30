import 'package:flutter/material.dart';

import '../../Colors/colors.dart';
import '../custom_Icon_button.dart';
import '../number_title_row.dart';


class AllOrdersButton extends StatelessWidget {
  const AllOrdersButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomIconButton(
      isallorder: true,
      text: "All Orders",
      menuItems: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.23,
          child: Column(
            children: [
              Expanded(
                child: NumberTitleRow(
                  number: 4,
                  title: "All orders",
                  textColor: Colors.white,
                  backgroundColor:     AppColor.secondaryColor,
                ),
              ),
              Expanded(
                child: NumberTitleRow(
                  number: 0,
                  title: "Delayed",
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
              Expanded(
                child: NumberTitleRow(
                  number: 0,
                  title: "Cancelled",
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
              Expanded(
                child: NumberTitleRow(
                  number: 0,
                  title: "Changed",
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
              Expanded(
                child: NumberTitleRow(
                  number: 0,
                  title: "pending",
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
              Expanded(
                child: NumberTitleRow(
                  number: 4,
                  title: "Pending Changed",
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
