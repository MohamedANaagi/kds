import 'package:cashier_app/features/order_body/data/models/orders.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  final dio = Dio();
  List<String> cashierIps = []; // قائمة عناوين IP الخاصة بالكاشير

  // تحميل قائمة IP المحفوظة
  Future<void> loadCashierIps() async {
    final prefs = await SharedPreferences.getInstance();
    cashierIps = prefs.getStringList('cashierIps') ?? [];
  }

  // إضافة IP جديد لقائمة الكاشير
  Future<void> addCashierIp(String newIp) async {
    if (!cashierIps.contains(newIp)) {
      cashierIps.add(newIp);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('cashierIps', cashierIps);
      print("Added new cashier IP: $newIp");
    }
  }

  // مسح كل عناوين IP الخاصة بالكاشير
  Future<void> clearAllCashierIps() async {
    cashierIps.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cashierIps');
    print("All cashier IPs have been cleared.");
  }

  // تحميل الطلبات وتحديث حالة الكاشير
  Future<void> loadOrderFromCashier({
    required String? lastFileName,
    required List<int> deletedOrderIds,
    required List<OrderModel> orders,
    required ValueNotifier<int> pending,
    required ValueNotifier<int> changed,
    required ValueNotifier<int> cancelled,
    required ValueNotifier<int> delayed,
    required ValueNotifier<int> pending_changed,
    required ValueNotifier<int> dineInCount,
    required ValueNotifier<int> pickupCount,
    required ValueNotifier<int> deliveryCount,
    required ValueNotifier<int> driveThruCount,
    required Function(OrderModel newOrder, String newFileName) onOrderAdded,
    required Function(String error) onError,
    required Function(String ip, bool isConnected) onConnectionStatusChanged,
  }) async {
    await loadCashierIps(); // تحديث قائمة الكاشير

    for (String ip in cashierIps) {
      try {
        final response = await dio.get('http://$ip:8080/file');

        if (response.statusCode == 200 && response.data != null) {
          onConnectionStatusChanged(ip, true); // تحديث حالة الاتصال إلى true

          final newFileName = response.headers['content-disposition']
              ?.firstWhere((header) => header.contains('filename='), orElse: () => '')
              ?.split('filename=')[1]
              ?.replaceAll('"', '');

          if (newFileName != null && newFileName != lastFileName) {
            final Map<String, dynamic> jsonData = response.data;
            final newOrder = OrderModel.fromMap(jsonData);

            if (!deletedOrderIds.contains(newOrder.id) &&
                !orders.any((order) => order.id == newOrder.id)) {
              onOrderAdded(newOrder, newFileName);

              switch (newOrder.type) {
                case 0:
                  dineInCount.value++;
                  break;
                case 1:
                  pickupCount.value++;
                  break;
                case 2:
                  deliveryCount.value++;
                  break;
                case 3:
                  driveThruCount.value++;
                  break;
              }
              switch (newOrder.status) {
                case 0:
                  pending.value++;
                  break;
                case 1:
                  changed.value++;
                  break;
                case 2:
                  cancelled.value++;
                  break;
                case 3:
                  delayed.value++;
                  break;
                case 3:
                  pending_changed.value++;
              }
            }
          }
        }
      } on DioError catch (e) {
        onConnectionStatusChanged(ip, false); // تعيين الحالة كـ غير متصل لو حدث خطأ
        onError("Network error: Unable to connect to cashier at IP $ip. Error: ${e.message}");
      } catch (e) {
        onError("Error processing data from IP $ip: $e");
      }
    }
  }
}
