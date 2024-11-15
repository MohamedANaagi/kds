import 'package:bloc/bloc.dart';
import 'package:cashier_app/database/database_helper.dart';
import 'package:cashier_app/features/history_feature/data/models/history_model.dart';
import 'package:cashier_app/features/order_body/data/models/orders.dart';
import 'package:flutter/material.dart';
class OrderCubit extends Cubit<OrderState> {
  final DatabaseHelper dbHelper;
  List<OrderModel> orders;

  OrderCubit(this.dbHelper, this.orders) : super(OrderInitial());

  // Method to set the list of orders
  void setOrders(List<OrderModel> newOrders) {
    orders = newOrders;
    emit(OrderUpdated()); // Optional: Emit a state to update UI
  }

  Future<void> bumpAllOrders({
    required ValueNotifier<int> allOrdersCounter,
    required ValueNotifier<int> dineInCount,
    required ValueNotifier<int> pickupCount,
    required ValueNotifier<int> deliveryCount,
    required ValueNotifier<int> driveThruCount,
    required ValueNotifier<int> pendingCount,
    required ValueNotifier<int> changedCount,
    required ValueNotifier<int> cancelledCount,
    required ValueNotifier<int> delayedCount,
    required ValueNotifier<int> pendingChangedCount,
    required Function(String) showSnackbar,
  }) async {
    try {
      final historyOrders = orders.map((order) => HistoryModel(
        id: order.id,
        serial: order.serial,
        type: order.type,
        createdAt: order.createdAt.toIso8601String(),
        orders: order.orders,
      )).toList();

      await dbHelper.insertAll(orders).then((_){

        emit(OrderBumped());

        // Reset values after bumping
        orders.clear();
        allOrdersCounter.value = 0;
        dineInCount.value = 0;
        pickupCount.value = 0;
        deliveryCount.value = 0;
        driveThruCount.value = 0;
        pendingCount.value = 0;
        changedCount.value = 0;
        cancelledCount.value = 0;
        delayedCount.value = 0;
        pendingChangedCount.value = 0;

        showSnackbar("All orders bumped and saved to history!");
      });

      }
 catch (e) {
      showSnackbar("Error saving orders to database: $e");
    }
  }
}

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderUpdated extends OrderState {}  // New state for order update

class OrderBumped extends OrderState {}
