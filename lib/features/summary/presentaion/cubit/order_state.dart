import 'package:cashier_app/features/order_body/data/models/orders.dart';
import 'package:flutter/foundation.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderUpdated extends OrderState {
  final ValueNotifier<int> dineInCount;
  final ValueNotifier<int> pickupCount;
  final ValueNotifier<int> deliveryCount;
  final ValueNotifier<int> driveThruCount;
  final ValueNotifier<int> allOrdersCounter;
  final ValueNotifier<int> pendingCount;
  final ValueNotifier<int> changedCount;
  final ValueNotifier<int> cancelledCount;
  final ValueNotifier<int> delayedCount;
  final ValueNotifier<int> pendingChangedCount;
  final List<OrderModel> orders;

  OrderUpdated({
    required this.dineInCount,
    required this.pickupCount,
    required this.deliveryCount,
    required this.driveThruCount,
    required this.allOrdersCounter,
    required this.pendingCount,
    required this.changedCount,
    required this.cancelledCount,
    required this.delayedCount,
    required this.pendingChangedCount,
    required this.orders,
  });
}

