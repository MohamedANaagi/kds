class Order {
  int id;
  String serial;
  int status;
  int type;
  String notes;
  double price;
  double tax;
  double discount;
  DateTime createdAt;
  List<OrderItem> orders; // قائمة لعناصر الطلبات

  Order({
    required this.id,
    required this.serial,
    required this.status,
    required this.type,
    required this.notes,
    required this.price,
    required this.tax,
    required this.discount,
    required this.createdAt,
    required this.orders,
  });

  // تحويل كائن Order إلى Map
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
      'createdAt': createdAt.toIso8601String(), // تحويل وقت الإنشاء إلى String
      'orders': orders.map((orderItem) => orderItem.toMap()).toList(), // تحويل عناصر الطلب إلى List من Map
    };
  }

  // دالة لتحويل Map إلى كائن Order
  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    serial: json["serial"],
    status: json["status"],
    type: json["type"],
    notes: json["notes"],
    price: json["price"].toDouble(),
    tax: json["tax"].toDouble(),
    discount: json["discount"].toDouble(),
    createdAt: DateTime.parse(json["createdAt"]),
    orders: List<OrderItem>.from(json["orders"].map((x) => OrderItem.fromJson(x))),
  );
}

class OrderItem {
  String uuid;
  int quantity;
  Product product;

  OrderItem({
    required this.uuid,
    required this.quantity,
    required this.product,
  });

  // تحويل كائن OrderItem إلى Map
  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'quantity': quantity,
      'product': product.toMap(), // تحويل المنتج إلى Map
    };
  }

  // دالة لتحويل Map إلى كائن OrderItem
  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    uuid: json["uuid"],
    quantity: json["quantity"],
    product: Product.fromJson(json["product"]),
  );
}

class Product {
  int id;
  String name;
  String localizedName;
  double price;
  double tax;

  Product({
    required this.id,
    required this.name,
    required this.localizedName,
    required this.price,
    required this.tax,
  });

  // تحويل كائن Product إلى Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'localizedName': localizedName,
      'price': price,
      'tax': tax,
    };
  }

  // دالة لتحويل Map إلى كائن Product
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    localizedName: json["localizedName"],
    price: json["price"].toDouble(),
    tax: json["tax"].toDouble(),
  );
}
