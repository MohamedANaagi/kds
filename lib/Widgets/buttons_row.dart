import 'package:cashier_app/Colors/colors.dart';
import 'package:cashier_app/Widgets/Buttons_widget/all_orders_button.dart';
import 'package:cashier_app/Widgets/Buttons_widget/history_button.dart';
import 'package:cashier_app/Widgets/Buttons_widget/manage_button.dart';
import 'package:cashier_app/Widgets/Buttons_widget/summry_button.dart';
import 'package:flutter/material.dart';



class ButtonsRow extends StatelessWidget {
  final ValueNotifier<int> dineInCount;
  final ValueNotifier<int> pickupCount;
  final ValueNotifier<int> deliveryCount;
  final ValueNotifier<int> driveThruCount;
  const ButtonsRow({Key? key, required this.dineInCount, required this.pickupCount, required this.deliveryCount, required this.driveThruCount}) : super(key: key);

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
          ),
          const SizedBox(width: 10),
          HistoryButton(),
          const SizedBox(width: 10),
          AllOrdersButton(),
          const SizedBox(width: 10),
          ManageButton(),
          const SizedBox(width: 10),
        ],
      ),
    ) ;
  }
}