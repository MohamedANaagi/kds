// domain/repositories/order_repository.dart


import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<List<OrderEntity>> getOrders();
  Future<void> deleteOrder(int orderId);
}
