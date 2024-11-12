import 'package:cashier_app/features/history_feature/domain/entities/history_entity.dart';

import '../repositories/order_repository.dart';

class GetOrderHistory {
  final OrderRepository repository;

  GetOrderHistory(this.repository);

  Future<List<HistoryEntity>> call() async {
    return await repository.getOrderHistory();
  }
}
