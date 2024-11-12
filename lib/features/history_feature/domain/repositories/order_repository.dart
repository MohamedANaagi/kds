import '../entities/history_entity.dart';

abstract class OrderRepository {
  Future<List<HistoryEntity>> getOrderHistory();
  Future<void> clearOrderHistory();
}
