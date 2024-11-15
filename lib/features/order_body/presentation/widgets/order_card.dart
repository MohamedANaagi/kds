import 'package:cashier_app/Colors/colors.dart';
import 'package:cashier_app/Widgets/custom_button.dart';
import 'package:cashier_app/features/order_body/presentation/widgets/order_item_list.dart';
import 'package:flutter/material.dart';
import 'package:cashier_app/Widgets/item_row.dart';
import 'package:cashier_app/features/order_body/data/models/orders.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  final VoidCallback onBump;

  const OrderCard({
    Key? key,
    required this.order,

    required this.onBump,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  color: AppColor.x, // تعديل اللون حسب الحاجة
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(order.createdAt.toIso8601String().substring(11, 16)),
                      Text("Done (#${order.id})"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Serial: ${order.serial}"),
                    Text(order.createdAt.toIso8601String().substring(11, 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cashier ID: ${order.id}"),
                    Text("Type: ${order.type}"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: OrderItemList(orderItems: order.orders),
          ),
          SizedBox(height: 10),
CustomButton(title: "Bump", onPressed: onBump) ,         // عرض الـ allOrdersCounter في الواجهة إذا كان ذلك مطلوبًا
        ],
      ),
    );
  }
}
