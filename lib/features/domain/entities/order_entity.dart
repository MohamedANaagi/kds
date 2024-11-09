// domain/entities/order_entity.dart

class OrderEntity {
  final int id;
  final String serial;
  final int status;
  final int type;
  final String notes;
  final double price;
  final double tax;
  final double discount;
  final DateTime createdAt;
  final List<OrderItemEntity> orders;

  OrderEntity({
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
}

// domain/entities/order_item_entity.dart

class OrderItemEntity {
  final String uuid;
  final int quantity;
  final ProductEntity product;
  final List<dynamic> productAddOn;
  final bool hasAddOns;
  final bool allRequiredAddOnsAdded;

  OrderItemEntity({
    required this.uuid,
    required this.quantity,
    required this.product,
    required this.productAddOn,
    required this.hasAddOns,
    required this.allRequiredAddOnsAdded,
  });
}

// domain/entities/product_entity.dart

class ProductEntity {
  final int id;
  final String name;
  final String localizedName;
  final dynamic image;
  final String code;
  final dynamic description;
  final double price;
  final double tax;
  final dynamic isPercentage;
  final List<dynamic> productAddOnGroups;

  ProductEntity({
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
}
