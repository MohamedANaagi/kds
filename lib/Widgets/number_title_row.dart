import 'package:cashier_app/Colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberTitleRow extends StatelessWidget {
  final int number;
  final String title;
  final Color textColor;
  final Color backgroundColor;

  const NumberTitleRow({
    Key? key,
    required this.number,
    required this.title,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Text(
            '$number',
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderRow extends StatelessWidget {
  final String number;
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
          // Main row content
          Container(
            color: backgroundColor,
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Spacer(),
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 10),
                Text(
                  '${number} X',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Green tape on the right
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Container(
              width: 10, // Adjust the width of the tape as needed
              color:  AppColor.x,
            ),
          ),
        ],
      ),
    );
  }
}