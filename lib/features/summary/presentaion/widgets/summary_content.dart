// lib/features/summary/presentation/widgets/summary_content.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/summary_cubit.dart';
import 'number_title_row.dart';

class SummaryContent extends StatelessWidget {
  final ValueNotifier<int> dineInCount;
  final ValueNotifier<int> pickupCount;
  final ValueNotifier<int> deliveryCount;
  final ValueNotifier<int> driveThruCount;
  final ValueNotifier<int> allOrdersCounter;

  const SummaryContent({
    Key? key,
    required this.dineInCount,
    required this.pickupCount,
    required this.deliveryCount,
    required this.driveThruCount,
    required this.allOrdersCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Summary", style: TextStyle(fontSize: 35, color: Colors.white)),
        Expanded(
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: dineInCount,
                builder: (context, value, child) => NumberTitleRow(number: value, title: "Dine In"),
              ),
              ValueListenableBuilder(
                valueListenable: pickupCount,
                builder: (context, value, child) => NumberTitleRow(number: value, title: "Pick Up"),
              ),
              ValueListenableBuilder(
                valueListenable: deliveryCount,
                builder: (context, value, child) => NumberTitleRow(number: value, title: "Delivery"),
              ),
              ValueListenableBuilder(
                valueListenable: driveThruCount,
                builder: (context, value, child) => NumberTitleRow(number: value, title: "Drive Thru"),
              ),
              ValueListenableBuilder(
                valueListenable: allOrdersCounter,
                builder: (context, value, child) => NumberTitleRow(number: value, title: "All Orders"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
