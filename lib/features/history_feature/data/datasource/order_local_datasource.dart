import 'package:cashier_app/database/database_helper.dart';

import 'package:cashier_app/features/history_feature/data/models/history_model.dart';

class OrderLocalDataSource {
  final DatabaseHelper databaseHelper;

  OrderLocalDataSource({required this.databaseHelper});

  Future<List<HistoryModel>> loadOrders() async {
    try {
      // الحصول على الأوامر من قاعدة البيانات باستخدام DatabaseHelper
      return await databaseHelper.getHistoryOrders();
    } catch (e) {
      print("Error loading orders from database: $e");
      return []; // تعيد قائمة فارغة في حالة حدوث خطأ
    }
  }

  Future<void> clearOrders() async {
    try {
      // مسح جميع الأوامر من قاعدة البيانات باستخدام DatabaseHelper
      await databaseHelper.clearDatabase();
    } catch (e) {
      print("Error clearing orders from database: $e");
    }
  }

  Future<void> saveOrder(HistoryModel order) async {
    try {
      // إدخال الأمر في قاعدة البيانات باستخدام DatabaseHelper
      await databaseHelper.insertHistoryOrder(order);
    } catch (e) {
      print("Error saving order to database: $e");
    }
  }
}
