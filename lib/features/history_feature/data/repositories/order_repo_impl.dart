import 'package:cashier_app/features/history_feature/data/models/history_model.dart';

import '../../domain/entities/history_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasource/order_local_datasource.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderLocalDataSource dataSource;

  OrderRepositoryImpl(this.dataSource);

  @override
  Future<List<HistoryEntity>> getOrderHistory() async {
    final orders = await dataSource.loadOrders();
    return (orders as List<HistoryModel>).map((order) => order.toEntity()).toList();
  }

  @override
  Future<void> clearOrderHistory() async {
    await dataSource.clearOrders();
  }
}
