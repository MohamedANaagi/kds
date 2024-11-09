import 'package:cashier_app/models/orders.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class OrderService {
  final dio = Dio();
  final String cashierIp = "192.168.1.5";

  Future<void> loadOrderFromCashier({
    required String? lastFileName,
    required List<int> deletedOrderIds,
    required List<Order> orders,
    required ValueNotifier<int> dineInCount,
    required ValueNotifier<int> pickupCount,
    required ValueNotifier<int> deliveryCount,
    required ValueNotifier<int> driveThruCount,
    required Function(Order newOrder, String newFileName) onOrderAdded,
    required Function(String error) onError,
  }) async {
    try {
      final response = await dio.get('http://$cashierIp:8080/file');

      if (response.statusCode == 200 && response.data != null) {
        final newFileName = response.headers['content-disposition']
            ?.firstWhere((header) => header.contains('filename='), orElse: () => '')
            ?.split('filename=')[1]
            ?.replaceAll('"', '');

        if (newFileName != null && newFileName != lastFileName) {
          final Map<String, dynamic> jsonData = response.data;
          final newOrder = Order.fromMap(jsonData);

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
          }
        }
      }
    } on DioError {
      onError("Network error: Unable to connect to cashier.");
    } catch (e) {
      onError("Error processing data: $e");
    }
  }

  Future<void> bumpOrder(
      Order order,
      ValueNotifier<int> dineInCount,
      ValueNotifier<int> pickupCount,
      ValueNotifier<int> deliveryCount,
      ValueNotifier<int> driveThruCount, {
        required VoidCallback onSuccess,
        required Function(String error) onError,
      }) async {
    try {
      // إضافة منطق الحفظ في قاعدة البيانات هنا.
      onSuccess();

      switch (order.type) {
        case 0:
          dineInCount.value--;
          break;
        case 1:
          pickupCount.value--;
          break;
        case 2:
          deliveryCount.value--;
          break;
        case 3:
          driveThruCount.value--;
          break;
      }
    } catch (e) {
      onError("Error saving order to database: $e");
    }
  }
}
