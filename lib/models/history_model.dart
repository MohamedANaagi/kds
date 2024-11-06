import 'dart:convert';
import 'orders.dart'; // Adjust the import path

class HistoryModel {
  final int id;
  final String serial;
  final int type;
  final String createdAt;
  List<OrderItem> orders;

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

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      id: map['id'],
      serial: map['serial'],
      type: map['type'],
      createdAt: map['createdAt'],
      orders: (jsonDecode(map['orders']) as List)
          .map((item) => OrderItem.fromMap(item))
          .toList(),
    );
  }
}
