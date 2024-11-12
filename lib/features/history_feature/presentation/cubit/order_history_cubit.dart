import 'dart:async';

import 'package:cashier_app/database/database_helper.dart';
import 'package:cashier_app/features/history_feature/data/models/history_model.dart';
import 'package:cashier_app/features/history_feature/domain/usecase/clear_order_history.dart';
import 'package:cashier_app/features/history_feature/domain/usecase/get_order_history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryCubit extends Cubit<List<HistoryModel>> {
  final GetOrderHistory getOrderHistory;
  final ClearOrderHistory clearOrderHistory;
  final DatabaseHelper databaseHelper;

  late StreamSubscription _orderStreamSubscription;

  OrderHistoryCubit(this.getOrderHistory, this.clearOrderHistory, this.databaseHelper)
      : super([]) {
    _orderStreamSubscription = databaseHelper.orderStream.listen((orders) {
      emit(orders); // تحديث الحالة عندما يحدث تغيير في البيانات
    });
  }

  void loadOrders() async {
    try {
      final orders = await getOrderHistory();
      final historyModels = orders.map((order) => HistoryModel.fromEntity(order)).toList();
      emit(historyModels);
    } catch (e) {
      print("Error loading orders: $e");
      emit([]); // في حالة حدوث خطأ، إصدار قائمة فارغة
    }
  }

  void clearOrders() async {
    await clearOrderHistory();
    emit([]);
  }

  @override
  Future<void> close() {
    _orderStreamSubscription.cancel(); // إلغاء الاشتراك عند غلق الـ Cubit
    return super.close();
  }
}
