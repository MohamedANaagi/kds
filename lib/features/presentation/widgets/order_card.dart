import 'package:cashier_app/Colors/colors.dart';
import 'package:cashier_app/Widgets/custom_button.dart';
import 'package:cashier_app/features/presentation/widgets/order_item_list.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/order_body.dart';
import '../../../models/orders.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onBump;

  const OrderCard({Key? key, required this.order, required this.onBump})
      : super(key: key);

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
                  color: AppColor.x, // تعديل اللون حسب حاجة التطبيق
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: order.createdAt.toIso8601String().substring(11, 16), colorindex: 0,),
                      CustomText(text: "Done (#${order.id})", colorindex: 0,),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Serial: ${order.serial}", colorindex: 1,),
                    CustomText(text: order.createdAt.toIso8601String().substring(11, 16), colorindex: 1,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Cashier ID: ${order.id}", colorindex: 1,),
                    CustomText(text: "Type: ${order.type}", colorindex: 1,),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: OrderItemList(orderItems: order.orders)),
          SizedBox(height: 10),
          CustomButton(title: "Bump", onPressed: onBump),
        ],
      ),
    );
  }
}
