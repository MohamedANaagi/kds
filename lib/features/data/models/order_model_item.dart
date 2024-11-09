// data/models/order_item_model.dart


import 'package:cashier_app/features/domain/entities/order_entity.dart';

import 'product_model.dart';

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required String uuid,
    required int quantity,
    required ProductModel product,
    required List<dynamic> productAddOn,
    required bool hasAddOns,
    required bool allRequiredAddOnsAdded,
  }) : super(
    uuid: uuid,
    quantity: quantity,
    product: product,
    productAddOn: productAddOn,
    hasAddOns: hasAddOns,
    allRequiredAddOnsAdded: allRequiredAddOnsAdded,
  );

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      uuid: json['uuid'],
      quantity: json['quantity'],
      product: ProductModel.fromJson(json['product']),
      productAddOn: json['productAddOn'],
      hasAddOns: json['hasAddOns'],
      allRequiredAddOnsAdded: json['allRequiredAddOnsAdded'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'quantity': quantity,
      'product': (product as ProductModel).toMap(),
      'productAddOn': productAddOn,
      'hasAddOns': hasAddOns,
      'allRequiredAddOnsAdded': allRequiredAddOnsAdded,
    };
  }
}
