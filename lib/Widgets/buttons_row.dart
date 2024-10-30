import 'package:cashier_app/Colors/colors.dart';
import 'package:cashier_app/Widgets/Buttons_widget/all_orders_button.dart';
import 'package:cashier_app/Widgets/Buttons_widget/history_button.dart';
import 'package:cashier_app/Widgets/Buttons_widget/manage_button.dart';
import 'package:cashier_app/Widgets/Buttons_widget/summry_button.dart';
import 'package:flutter/material.dart';



class ButtonsRow extends StatelessWidget {
  const ButtonsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: MediaQuery.of(context).size.height * 0.16,
      child: Row(
        children: [
          const Spacer(flex: 1),
           SummryButton(),
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
