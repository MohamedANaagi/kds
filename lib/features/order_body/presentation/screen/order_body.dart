import 'dart:async';
import 'package:cashier_app/database/database_helper.dart';
import 'package:cashier_app/features/order_body/presentation/widgets/order_services.dart';
import 'package:flutter/material.dart';
import 'package:cashier_app/features/order_body/data/models/orders.dart';
import 'package:cashier_app/features/history_feature/data/models/history_model.dart';

import '../widgets/order_card.dart';

class OrderBody2 extends StatefulWidget {
  final ValueNotifier<int> dineInCount;
  final ValueNotifier<int> pickupCount;
  final ValueNotifier<int> deliveryCount;
  final ValueNotifier<int> driveThruCount;
  final ValueNotifier<int> allOrdersCounter;
  final ValueNotifier<int> pendingCount ;
  final ValueNotifier<int> changedCount ;
  final ValueNotifier<int> cancelledCount;
  final ValueNotifier<int> delayedCount ;
  final ValueNotifier<int> pendingChangedCount;

  const OrderBody2({
    Key? key,
    required this.dineInCount,
    required this.pickupCount,
    required this.deliveryCount,
    required this.driveThruCount,
    required this.allOrdersCounter, required this.pendingCount, required this.changedCount, required this.cancelledCount, required this.delayedCount, required this.pendingChangedCount,
  }) : super(key: key);

  @override
  _OrderBodyState createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody2> {
  List<OrderModel> orders = [];
  List<int> deletedOrderIds = [];
  final OrderService orderService = OrderService();
  final dbHelper = DatabaseHelper(); // تأكد من تعريف dbHelper
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
            widget.allOrdersCounter.value++;
            lastFileName = fileName;
          });
        },
        onError: showSnackbar, pending: widget.pendingCount,
        changed: widget.changedCount,
        cancelled: widget.cancelledCount,
        delayed: widget.cancelledCount,
        pending_changed: widget.pendingChangedCount,
      );
    });
  }

  Future<void> bumpOrder(int index) async {
    final order = orders[index];

    // إنشاء نموذج HistoryModel للطلب
    final historyOrder = HistoryModel(
      id: order.id,
      serial: order.serial,
      type: order.type,
      createdAt: order.createdAt.toIso8601String(),
      orders: order.orders,
    );

    // إدخال الطلب في قاعدة البيانات
    await dbHelper.insertHistoryOrder(historyOrder).then((_) {
      setState(() {
        orders.removeAt(index); // إزالة الطلب من القائمة
        deletedOrderIds.add(order.id); // إضافة الطلب إلى قائمة المحذوفات

        // تحديث العدادات حسب نوع الطلب
        updateCounter(order.type.toString(), -1);
        widget.allOrdersCounter.value--; // تقليل العداد الشامل
      });
      showSnackbar("Order bumped and saved to history!");
    }).catchError((e) {
      showSnackbar("Error saving order to database: $e");
      print("Error saving order to database: $e");
    });
  }

  void updateCounter(String orderType, int change) {
    switch (orderType) {
      case "Dine-In":
        widget.dineInCount.value += change;
        break;
      case "Pickup":
        widget.pickupCount.value += change;
        break;
      case "Delivery":
        widget.deliveryCount.value += change;
        break;
      case "Drive-Thru":
        widget.driveThruCount.value += change;
        break;
    }
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
            dineInCount: widget.dineInCount,
            pickupCount: widget.pickupCount,
            deliveryCount: widget.deliveryCount,
            driveThruCount: widget.driveThruCount,
            allOrdersCounter: widget.allOrdersCounter,
            onBump: () async => await bumpOrder(index),
          );
        },
      ),
    );
  }
}
