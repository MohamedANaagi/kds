// lib/features/summary/presentation/widgets/number_title_row.dart

import 'package:flutter/material.dart';

class NumberTitleRow extends StatelessWidget {
  final int number;
  final String title;

  const NumberTitleRow({Key? key, required this.number, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 15, color: Colors.grey)),
        Text(number.toString(), style: TextStyle(fontSize: 15, color: Colors.black)),
      ],
    );
  }
}
