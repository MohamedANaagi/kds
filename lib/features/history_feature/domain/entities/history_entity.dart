import 'package:cashier_app/features/order_body/data/models/orders.dart';

class HistoryEntity {
  final int id;
  final String serial;
  final int type;
  final String createdAt;
  final List<OrderItemModel> orders;

  HistoryEntity({
    required this.id,
    required this.serial,
    required this.type,
    required this.createdAt,
    required this.orders,
  });
}
