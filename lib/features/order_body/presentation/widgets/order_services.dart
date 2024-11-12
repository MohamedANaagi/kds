import 'package:cashier_app/features/order_body/data/models/orders.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class OrderService {
  final dio = Dio();
  final String cashierIp = "192.168.1.5";

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
    } on DioError {
     // onError("Network error: Unable to connect to cashier.");
    } catch (e) {
      onError("Error processing data: $e");
    }
  }

  Future<void> bumpOrder(
      OrderModel order,
      ValueNotifier<int> dineInCount,
   ValueNotifier<int> pending,
   ValueNotifier<int> changed,
   ValueNotifier<int> cancelled,
   ValueNotifier<int> delayed,
   ValueNotifier<int> pending_changed,
      ValueNotifier<int> pickupCount,
      ValueNotifier<int> deliveryCount,
      ValueNotifier<int> driveThruCount, {
        required VoidCallback onSuccess,
        required Function(String error) onError,
      }) async {
    try {
      // Add logic to save to database here.
      onSuccess();
      switch(order.status){
        case 0:
          pending.value--;
          break;
        case 1:
          changed.value--;
          break;
        case 2:
          cancelled.value--;
          break;
        case 3:
          delayed.value--;
          break;
        case 4:
          pending_changed.value--;
      }

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
