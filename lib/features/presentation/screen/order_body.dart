import 'dart:async';

import 'package:cashier_app/features/presentation/widgets/order_services.dart';
import 'package:cashier_app/models/orders.dart';
import 'package:flutter/material.dart';
import '../widgets/order_card.dart';

class OrderBody2 extends StatefulWidget {
  final ValueNotifier<int> dineInCount;
  final ValueNotifier<int> pickupCount;
  final ValueNotifier<int> deliveryCount;
  final ValueNotifier<int> driveThruCount;

  const OrderBody2({
    Key? key,
    required this.dineInCount,
    required this.pickupCount,
    required this.deliveryCount,
    required this.driveThruCount,
  }) : super(key: key);

  @override
  _OrderBodyState createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody2> {
  List<Order> orders = [];
  List<int> deletedOrderIds = [];
  final OrderService orderService = OrderService();
  Timer? timer;
  String? lastFileName;

  @override
  void initState() {
    super.initState();
    startPolling();
  }

  void startPolling() {
    timer = Timer.periodic(Duration(milliseconds: 20), (_) {
      orderService.loadOrderFromCashier(
        lastFileName: lastFileName,
        deletedOrderIds: deletedOrderIds,
        orders: orders,
        dineInCount: widget.dineInCount,
        pickupCount: widget.pickupCount,
        deliveryCount: widget.deliveryCount,
        driveThruCount: widget.driveThruCount,
        onOrderAdded: (newOrder, fileName) {
          setState(() {
            orders.add(newOrder);
            lastFileName = fileName;
          });
        },
        onError: showSnackbar,
      );
    });
  }

  Future<void> bumpOrder(int index) async {
    await orderService.bumpOrder(
      orders[index],
      widget.dineInCount,
      widget.pickupCount,
      widget.deliveryCount,
      widget.driveThruCount,
      onSuccess: () => setState(() => orders.removeAt(index)),
      onError: showSnackbar,
    );
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: orders.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return OrderCard(
            order: orders[index],
            onBump: () async => await bumpOrder(index),
          );
        },
      ),
    );
  }
}
