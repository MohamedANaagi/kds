



import 'package:flutter/material.dart';

import '../constant/Colors/colors.dart';



class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    this.cancelText = "Cancel",
    this.confirmText = "Bump",
    this.onCancel,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      content: Text(content),
      actions: [

        TextButton(
          onPressed: onCancel ?? () => Navigator.of(context).pop(),
          child: Text(cancelText, style: TextStyle(color: Colors.red,fontSize: 20)),
        ),

        TextButton(
          onPressed: onConfirm ?? () => Navigator.of(context).pop(),
          child: Text(confirmText, style: TextStyle(color: AppColor.x,fontSize: 20,)),
        ),
      ],
    );
  }
}
