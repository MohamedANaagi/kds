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
  List<OrderItem> orders;

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

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
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
          .map((order) => OrderItem.fromJson(order))
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
      'orders': orders.map((order) => order.toMap()).toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      serial: map['serial'],
      status: map['status'],
      type: map['type'],
      notes: map['notes'],
      price: map['price'],
      tax: map['tax'],
      discount: map['discount'],
      createdAt: DateTime.parse(map['createdAt']),
      orders: (map['orders'] as List<dynamic>)
          .map((orderMap) => OrderItem.fromMap(orderMap))
          .toList(),
    );
  }
}

class OrderItem {
  String uuid;
  int quantity;
  Product product;
  List<dynamic> productAddOn;
  bool hasAddOns;
  bool allRequiredAddOnsAdded;

  OrderItem({
    required this.uuid,
    required this.quantity,
    required this.product,
    required this.productAddOn,
    required this.hasAddOns,
    required this.allRequiredAddOnsAdded,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      uuid: json['uuid'],
      quantity: json['quantity'],
      product: Product.fromJson(json['product']),
      productAddOn: List<dynamic>.from(json['productAddOn']),
      hasAddOns: json['hasAddOns'],
      allRequiredAddOnsAdded: json['allRequiredAddOnsAdded'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'quantity': quantity,
      'product': product.toMap(),
      'productAddOn': productAddOn,
      'hasAddOns': hasAddOns,
      'allRequiredAddOnsAdded': allRequiredAddOnsAdded,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      uuid: map['uuid'],
      quantity: map['quantity'],
      product: Product.fromMap(map['product']),
      productAddOn: List<dynamic>.from(map['productAddOn']),
      hasAddOns: map['hasAddOns'],
      allRequiredAddOnsAdded: map['allRequiredAddOnsAdded'],
    );
  }
}

class Product {
  int id;
  String name;
  String localizedName;
  dynamic image;
  String code;
  dynamic description;
  double price;
  double tax;
  dynamic isPercentage;
  List<dynamic> productAddOnGroups;

  Product({
    required this.id,
    required this.name,
    required this.localizedName,
    this.image,
    required this.code,
    this.description,
    required this.price,
    required this.tax,
    this.isPercentage,
    required this.productAddOnGroups,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      localizedName: json['localizedName'],
      image: json['image'],
      code: json['code'],
      description: json['description'],
      price: json['price'].toDouble(),
      tax: json['tax'].toDouble(),
      isPercentage: json['isPercentage'],
      productAddOnGroups: List<dynamic>.from(json['productAddOnGroups']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'localizedName': localizedName,
      'image': image,
      'code': code,
      'description': description,
      'price': price,
      'tax': tax,
      'isPercentage': isPercentage,
      'productAddOnGroups': productAddOnGroups,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      localizedName: map['localizedName'],
      image: map['image'],
      code: map['code'],
      description: map['description'],
      price: map['price'],
      tax: map['tax'],
      isPercentage: map['isPercentage'],
      productAddOnGroups: List<dynamic>.from(map['productAddOnGroups']),
    );
  }
}
