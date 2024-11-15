import 'package:cashier_app/features/history_feature/presentation/screens/history_button.dart';
import 'package:cashier_app/features/main_screen/Buttons_widget/all_orders_button.dart';
import 'package:cashier_app/features/main_screen/Buttons_widget/manage_button.dart';
import 'package:cashier_app/features/main_screen/Buttons_widget/summry_button.dart';
import 'package:flutter/material.dart';



class ButtonsRow extends StatelessWidget {
  final ValueNotifier<int> dineInCount;
  final ValueNotifier<int> pickupCount;
  final ValueNotifier<int> deliveryCount;
  final ValueNotifier<int> driveThruCount;
  final ValueNotifier<int> allOrdersCounter;
  final ValueNotifier<int> pendingCount;
  final ValueNotifier<int> changedCount;
  final ValueNotifier<int> cancelledCount;
  final ValueNotifier<int> delayedCount;
  final ValueNotifier<int> pendingChangedCount;


  const ButtonsRow({Key? key, required this.dineInCount, required this.pickupCount, required this.deliveryCount, required this.driveThruCount, required this.allOrdersCounter, required this.pendingCount, required this.changedCount, required this.cancelledCount, required this.delayedCount, required this.pendingChangedCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: MediaQuery.of(context).size.height * 0.16,
      child: Row(
        children: [
          const Spacer(flex: 1),
          SummryButton(
            dineInCount: dineInCount,
            pickupCount: pickupCount,
            deliveryCount: deliveryCount,
            driveThruCount: driveThruCount,
            allOrdersCounter: allOrdersCounter,
            pendingCount: pendingCount,
            pendingChangedCount: pendingChangedCount,
            cancelledCount: cancelledCount,
            changedCount: changedCount,
            delayedCount: delayedCount, // تمريره هنا

          ),
          const SizedBox(width: 10),
          HistoryButtonScreen(),
          const SizedBox(width: 10),
          AllOrdersButton(pending: pendingCount, changed: changedCount, cancelled: cancelledCount, delayed: delayedCount, allOrdersCounter: allOrdersCounter, pending_changed: pendingChangedCount,

          ),
          const SizedBox(width: 10),
          ManageButton(),
          const SizedBox(width: 10),
        ],
      ),
    ) ;
  }
}