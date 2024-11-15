import 'package:flutter/material.dart';

import '../constant/Colors/colors.dart';

class OrderRow extends StatelessWidget {
  final int number;
  final String title;
  final Color textColor;
  final Color backgroundColor;

  const OrderRow({
    Key? key,
    required this.number,
    required this.title,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Container(
            color: backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Spacer(),
                Text(
                  title,
                  style: TextStyle(color: textColor, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 10),
                Text(
                  '${number} X',
                  style: TextStyle(color: textColor, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Container(
              width: 10,
              color: AppColor.x,
            ),
          ),
        ],
      ),
    );
  }
}
