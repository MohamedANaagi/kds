import 'package:cashier_app/Widgets/item_row.dart';
import 'package:cashier_app/Widgets/order_row.dart';
import 'package:cashier_app/features/order_body/data/models/orders.dart';
import 'package:flutter/material.dart';


class OrderItemList extends StatelessWidget {
  final List<OrderItemModel> orderItems;

  const OrderItemList({Key? key, required this.orderItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        final item = orderItems[index];
        return OrderRow(title: item.product.name, number: item.quantity);
      },
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }
}
