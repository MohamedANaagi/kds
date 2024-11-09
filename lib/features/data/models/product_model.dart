// data/models/product_model.dart


import '../../domain/entities/order_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int id,
    required String name,
    required String localizedName,
    dynamic image,
    required String code,
    dynamic description,
    required double price,
    required double tax,
    dynamic isPercentage,
    required List<dynamic> productAddOnGroups,
  }) : super(
    id: id,
    name: name,
    localizedName: localizedName,
    image: image,
    code: code,
    description: description,
    price: price,
    tax: tax,
    isPercentage: isPercentage,
    productAddOnGroups: productAddOnGroups,
  );

  // Convert from JSON to ProductModel
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
      productAddOnGroups: json['productAddOnGroups'] ?? [],
    );
  }

  // Convert from ProductModel to Map
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
}
