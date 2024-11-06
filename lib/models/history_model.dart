

class HistoryModel {
  final int id;
  final String serial;
  final int type;
  final String createdAt;
  final String orders;

  HistoryModel({
    required this.id,
    required this.serial,
    required this.type,
    required this.createdAt,
    required this.orders,
  });

  // لتحويل البيانات إلى خريطة عند الحفظ في قاعدة البيانات
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serial': serial,
      'type': type,
      'createdAt': createdAt,
      'orders': orders,
    };
  }

  // لتحويل البيانات من قاعدة البيانات إلى كائن HistoryModel
  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      id: map['id'],
      serial: map['serial'],
      type: map['type'],
      createdAt: map['createdAt'],
      orders: map['orders'],
    );
  }
}