import 'package:flutter/material.dart';
import 'package:cashier_app/features/order_body/presentation/screen/order_body.dart';
import 'buttons_row.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  // تعريف ValueNotifiers لحساب كل نوع من الطلبات وعدد الإجمالي
  final ValueNotifier<int> dineInCount = ValueNotifier<int>(0);
  final ValueNotifier<int> pickupCount = ValueNotifier<int>(0);
  final ValueNotifier<int> deliveryCount = ValueNotifier<int>(0);
  final ValueNotifier<int> driveThruCount = ValueNotifier<int>(0);
  final ValueNotifier<int> allOrdersCounter = ValueNotifier<int>(0); // عداد إجمالي الطلبات
  final ValueNotifier<int> pendingCount = ValueNotifier<int>(0);
  final ValueNotifier<int> changedCount = ValueNotifier<int>(0);
  final ValueNotifier<int> cancelledCount = ValueNotifier<int>(0);
  final ValueNotifier<int> delayedCount = ValueNotifier<int>(0);
  final ValueNotifier<int> pendingChangedCount = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ButtonsRow(
            dineInCount: dineInCount,
            pickupCount: pickupCount,
            deliveryCount: deliveryCount,
            driveThruCount: driveThruCount,
            allOrdersCounter: allOrdersCounter,
            pendingCount: pendingCount,
            changedCount: changedCount,
            cancelledCount: cancelledCount,
            delayedCount: delayedCount,
            pendingChangedCount: pendingChangedCount, // تمريره هنا
          ),
          SizedBox(height: 20),
          // تمرير allOrdersCounter إلى OrderBody2
          OrderBody2(
            dineInCount: dineInCount,
            pickupCount: pickupCount,
            deliveryCount: deliveryCount,
            driveThruCount: driveThruCount,
            allOrdersCounter: allOrdersCounter,
            pendingCount: pendingCount,
            changedCount: changedCount,
            cancelledCount: cancelledCount,
            delayedCount: delayedCount,
            pendingChangedCount: pendingChangedCount, // تمريره هنا
          ),
        ],
      ),
    );
  }
}
