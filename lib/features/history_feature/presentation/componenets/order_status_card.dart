import 'package:flutter/material.dart';
import '../../data/models/history_model.dart';

class OrderStatusCardComponent extends StatelessWidget {
  final HistoryModel order;

  const OrderStatusCardComponent({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            color: Color(0xFF95A5A5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.createdAt.substring(11, 16),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "Done (#${order.id})",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Type: ${order.type}",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Status: Completed",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
