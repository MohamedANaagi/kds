import 'dart:convert';

import 'package:cashier_app/features/history_feature/domain/entities/history_entity.dart';
import 'package:cashier_app/features/order_body/data/models/orders.dart';

class HistoryModel {
  final int id;
  final String serial;
  final int type;
  final String createdAt;
  final List<OrderItemModel> orders;

  HistoryModel({
    required this.id,
    required this.serial,
    required this.type,
    required this.createdAt,
    required this.orders,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serial': serial,
      'type': type,
      'createdAt': createdAt,
      'orders': jsonEncode(orders.map((item) => item.toMap()).toList()), // Convert orders to JSON string
    };
  }
  factory HistoryModel.fromEntity(HistoryEntity entity) {
    return HistoryModel(
      id: entity.id,
      serial: entity.serial,
      type: entity.type,
      createdAt: entity.createdAt,
      orders: entity.orders.map((order) => OrderItemModel.fromEntity(order)).toList(), // استخدام OrderItemModel

    );
  }
    // يمكن تحويل HistoryModel إلى HistoryEntity، أو العكس
  HistoryEntity toEntity() {
    return HistoryEntity(
      id: id,
      serial: serial,
      type: type,
      createdAt: createdAt,
      orders: orders,
    );
  }
}
