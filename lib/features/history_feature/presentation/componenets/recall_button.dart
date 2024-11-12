import 'package:cashier_app/Widgets/custom_alert_Dialog.dart';
import 'package:cashier_app/Widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RecallButtonComponent extends StatelessWidget {
  const RecallButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "Recall",
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: "Bump All",
              content: "Are you sure you want to bump all your orders?",
              cancelText: "Cancel",
              confirmText: "Bump",
              onCancel: () => Navigator.of(context).pop(),
              onConfirm: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}
