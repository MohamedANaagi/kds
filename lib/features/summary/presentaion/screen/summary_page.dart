// lib/features/summary/summary_page.dart

import 'package:cashier_app/features/summary/presentaion/cubit/summary_cubit.dart';
import 'package:cashier_app/features/summary/presentaion/widgets/summary_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryPage extends StatelessWidget {
  final ValueNotifier<int> dineInCount;
  final ValueNotifier<int> pickupCount;
  final ValueNotifier<int> deliveryCount;
  final ValueNotifier<int> driveThruCount;
  final ValueNotifier<int> allOrdersCounter;

  const SummaryPage({
    Key? key,
    required this.dineInCount,
    required this.pickupCount,
    required this.deliveryCount,
    required this.driveThruCount,
    required this.allOrdersCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SummaryCubit(),
      child: SummaryContent(
        dineInCount: dineInCount,
        pickupCount: pickupCount,
        deliveryCount: deliveryCount,
        driveThruCount: driveThruCount,
        allOrdersCounter: allOrdersCounter,
      ),
    );
  }
}
