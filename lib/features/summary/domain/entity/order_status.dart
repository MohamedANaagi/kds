// lib/features/summary/domain/entities/order_status.dart

class OrderStatus {
  final int dineInCount;
  final int pickupCount;
  final int deliveryCount;
  final int driveThruCount;
  final int allOrdersCount;

  OrderStatus({
    required this.dineInCount,
    required this.pickupCount,
    required this.deliveryCount,
    required this.driveThruCount,
    required this.allOrdersCount,
  });
}
