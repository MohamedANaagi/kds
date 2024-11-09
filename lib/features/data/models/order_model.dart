// data/models/order_model.dart


import 'package:cashier_app/features/data/models/order_model_item.dart';
import 'package:cashier_app/features/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required int id,
    required String serial,
    required int status,
    required int type,
    required String notes,
    required double price,
    required double tax,
    required double discount,
    required DateTime createdAt,
    required List<OrderItemModel> orders,
  }) : super(
    id: id,
    serial: serial,
    status: status,
    type: type,
    notes: notes,
    price: price,
    tax: tax,
    discount: discount,
    createdAt: createdAt,
    orders: orders,
  );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      serial: json['serial'],
      status: json['status'],
      type: json['type'],
      notes: json['notes'] ?? '',
      price: json['price'].toDouble(),
      tax: json['tax'].toDouble(),
      discount: json['discount'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      orders: (json['orders'] as List)
          .map((order) => OrderItemModel.fromJson(order))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serial': serial,
      'status': status,
      'type': type,
      'notes': notes,
      'price': price,
      'tax': tax,
      'discount': discount,
      'createdAt': createdAt.toIso8601String(),
      'orders': orders.map((order) => (order as OrderItemModel).toMap()).toList(),
    };
  }
}
