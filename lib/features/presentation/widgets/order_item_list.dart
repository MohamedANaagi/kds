import 'package:cashier_app/Widgets/item_row.dart';
import 'package:cashier_app/Widgets/order_body.dart';
import 'package:cashier_app/models/orders.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/number_title_row.dart';

class OrderItemList extends StatelessWidget {
  final List<OrderItem> orderItems;

  const OrderItemList({Key? key, required this.orderItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        final item = orderItems[index];
        return OrderRow(title: item.product.name, number: item.quantity.toString());
      },
      shrinkWrap: true,
      physics: ClampingScrollPhysics(), // To prevent excessive scrolling
    );
  }
}
