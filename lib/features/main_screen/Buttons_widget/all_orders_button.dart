import 'package:cashier_app/features/summary/presentaion/widgets/number_title_row.dart';
import 'package:flutter/material.dart';

import '../../../utlis/Widgets/custom_Icon_button.dart';


class AllOrdersButton extends StatelessWidget {
  final ValueNotifier<int> pending;
  final ValueNotifier<int> changed;
  final ValueNotifier<int> cancelled;
  final ValueNotifier<int> delayed;
  final ValueNotifier<int> pending_changed;
  final ValueNotifier<int> allOrdersCounter;

  const AllOrdersButton({super.key, required this.pending, required this.changed, required this.cancelled, required this.delayed, required this.allOrdersCounter,required this.pending_changed});

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
                child: ValueListenableBuilder(
                  valueListenable: allOrdersCounter,
                  builder: (context, value, child) => NumberTitleRow(number: value, title: "All Orders"),
                ),
              ),
              Expanded(
                child:ValueListenableBuilder(
                  valueListenable: delayed,
                  builder: (context, value, child) => NumberTitleRow(number: value, title: "Delayed"),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: changed,
                  builder: (context, value, child) => NumberTitleRow(number: value, title: "Changed"),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: cancelled,
                  builder: (context, value, child) => NumberTitleRow(number: value, title: "Cancelled"),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: pending,
                  builder: (context, value, child) => NumberTitleRow(number: value, title: "Pending"),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: pending_changed,
                  builder: (context, value, child) => NumberTitleRow(number: value, title: "Pending Changed"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
