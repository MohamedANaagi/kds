// domain/usecases/get_orders_usecase.dart


import '../entities/order_entity.dart';
import '../repo/order_repo.dart';

class GetOrdersUseCase {
  final OrderRepository repository;

  GetOrdersUseCase(this.repository);

  Future<List<OrderEntity>> call() async {
    return await repository.getOrders();
  }
}

// domain/usecases/delete_order_usecase.dart


class DeleteOrderUseCase {
  final OrderRepository repository;

  DeleteOrderUseCase(this.repository);

  Future<void> call(int orderId) async {
    return await repository.deleteOrder(orderId);
  }
}
