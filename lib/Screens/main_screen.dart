
import 'package:cashier_app/Colors/colors.dart';
import 'package:flutter/material.dart';

import '../Widgets/buttons_row.dart';
import '../Widgets/order_body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [

          ButtonsRow(),
          SizedBox(height: 20,),
          OrderBody(),
        ],
      ),
    );
  }
}