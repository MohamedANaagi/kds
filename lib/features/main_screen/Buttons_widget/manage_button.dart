import 'package:cashier_app/Screens/manage_screen.dart';
import 'package:flutter/material.dart';

import '../../../utlis/Widgets/custom_Icon_button.dart';



class ManageButton extends StatelessWidget {
  const ManageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      isallorder: false,
      text: "Manage",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ManageScreen(),
          ),
        );
      },
      menuItems: [
        Text("Manage 1"),
        Text("Manage 2"),
        Text("Manage 3"),
      ],
    );
  }
}
