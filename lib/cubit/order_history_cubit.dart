import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/history_model.dart';
import '../database/database_helper.dart';

class OrderHistoryCubit extends Cubit<List<HistoryModel>> {
  final DatabaseHelper dbHelper;

  OrderHistoryCubit(this.dbHelper) : super([]);

  // Method to load all orders from the database
  Future<void> loadOrders() async {
    final orders = await dbHelper.getHistoryOrders();
    emit(orders);
  }

  // Method to add a new order to the database and reload orders
  Future<void> addOrder(HistoryModel order) async {
    await dbHelper.insertHistoryOrder(order);
    await loadOrders(); // Reload orders after adding a new one
  }

  // Method to clear all orders from the database
  void clearOrders() async {
    await dbHelper.clearDatabase();
    emit([]); // Emit empty list to clear the UI
  }

  // Method to check if there is any data in the database
  Future<void> checkIfDataExists() async {
    final orders = await dbHelper.getHistoryOrders();
    if (orders.isNotEmpty) {
      emit(orders); // If data exists, emit it to update the UI
    } else {
      emit([]); // If no data, emit empty list
    }
  }
}
