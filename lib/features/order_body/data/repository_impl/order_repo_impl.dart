// data/repositories/order_repository_impl.dart

import 'package:cashier_app/features/order_body/data/datasource/order_remote_datsource.dart';
import 'package:cashier_app/features/order_body/domain/repo/order_repo.dart';
import 'package:cashier_app/features/order_body/data/models/orders.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<OrderModel>> getOrders() async {
    return await remoteDataSource.fetchOrders();
  }

  @override
  Future<void> deleteOrder(int orderId) async {
    return await remoteDataSource.deleteOrder(orderId);
  }
}
