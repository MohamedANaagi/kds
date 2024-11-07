import 'package:cashier_app/Colors/colors.dart';
import 'package:flutter/material.dart';

import '../Widgets/buttons_row.dart';
import '../Widgets/order_body.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final ValueNotifier<int> dineInCount = ValueNotifier<int>(0);
  final ValueNotifier<int> pickupCount = ValueNotifier<int>(0);
  final ValueNotifier<int> deliveryCount = ValueNotifier<int>(0);
  final ValueNotifier<int> driveThruCount = ValueNotifier<int>(0);

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

          ),
          SizedBox(height: 20,),
          OrderBody(            dineInCount: dineInCount,
            pickupCount: pickupCount,
            deliveryCount: deliveryCount,
            driveThruCount: driveThruCount,
          ),
        ],
      ),
    );
  }
}