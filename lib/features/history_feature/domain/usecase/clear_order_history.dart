import '../repositories/order_repository.dart';

class ClearOrderHistory {
  final OrderRepository repository;

  ClearOrderHistory(this.repository);

  Future<void> call() async {
    await repository.clearOrderHistory();
  }
}
