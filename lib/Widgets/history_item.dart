import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final int number;
  final Function()? onTap;
  const HistoryItem({super.key, required this.number, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        "Order #${number}",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
