import 'package:cashier_app/features/order_body/domain/entities/order_entity.dart';

class OrderModel {
  int id;
  String serial;
  int status;
  int type;
  String notes;
  double price;
  double tax;
  double discount;
  DateTime createdAt;
  List<OrderItemModel> orders;

  OrderModel({
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
      'orders': orders.map((order) => order.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
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
          .map((orderMap) => OrderItemModel.fromMap(orderMap))
          .toList(),
    );
  }
}

class OrderItemModel {
  String uuid;
  int quantity;
  ProductModel product;
  List<dynamic> productAddOn;
  bool hasAddOns;
  bool allRequiredAddOnsAdded;

  OrderItemModel({
    required this.uuid,
    required this.quantity,
    required this.product,
    required this.productAddOn,
    required this.hasAddOns,
    required this.allRequiredAddOnsAdded,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      uuid: json['uuid'],
      quantity: json['quantity'],
      product: ProductModel.fromJson(json['product']),
      productAddOn: List<dynamic>.from(json['productAddOn']),
      hasAddOns: json['hasAddOns'],
      allRequiredAddOnsAdded: json['allRequiredAddOnsAdded'],
    );
  }
  factory OrderItemModel.fromEntity(OrderItemModel entity) {
    return OrderItemModel(
      uuid: entity.uuid,
      product: ProductModel.fromEntity(entity.product), // تحويل المنتج إلى ProductModel
      quantity: entity.quantity,
      productAddOn: entity.productAddOn,
      hasAddOns: entity.hasAddOns,
      allRequiredAddOnsAdded: entity.allRequiredAddOnsAdded,
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

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      uuid: map['uuid'],
      quantity: map['quantity'],
      product: ProductModel.fromMap(map['product']),
      productAddOn: List<dynamic>.from(map['productAddOn']),
      hasAddOns: map['hasAddOns'],
      allRequiredAddOnsAdded: map['allRequiredAddOnsAdded'],
    );
  }
}

class ProductModel {
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

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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
  factory ProductModel.fromEntity(ProductModel entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      localizedName: entity.localizedName,
      image: entity.image,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      tax: entity.tax,
      isPercentage: entity.isPercentage,
      productAddOnGroups: entity.productAddOnGroups,
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

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
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
