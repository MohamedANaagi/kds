// data/datasources/order_remote_data_source.dart

import 'package:cashier_app/features/data/models/order_model.dart';
import 'package:dio/dio.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> fetchOrders();
  Future<void> deleteOrder(int orderId);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Dio apiClient;

  OrderRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<OrderModel>> fetchOrders() async {
    final response = await apiClient.get('https://yourapi.com/orders');
    return (response.data as List)
        .map((order) => OrderModel.fromJson(order))
        .toList();
  }

  @override
  Future<void> deleteOrder(int orderId) async {
    await apiClient.delete('https://yourapi.com/orders/$orderId');
  }
}
