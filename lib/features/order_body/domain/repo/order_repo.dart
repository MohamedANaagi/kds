// domain/repositories/order_repository.dart


import 'package:cashier_app/features/order_body/data/models/orders.dart';

import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<List<OrderModel>> getOrders();
  Future<void> deleteOrder(int orderId);
}
