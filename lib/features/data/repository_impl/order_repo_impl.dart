// data/repositories/order_repository_impl.dart

import 'package:cashier_app/features/data/datasource/order_remote_datsource.dart';
import 'package:cashier_app/features/domain/entities/order_entity.dart';
import 'package:cashier_app/features/domain/repo/order_repo.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<OrderEntity>> getOrders() async {
    return await remoteDataSource.fetchOrders();
  }

  @override
  Future<void> deleteOrder(int orderId) async {
    return await remoteDataSource.deleteOrder(orderId);
  }
}
