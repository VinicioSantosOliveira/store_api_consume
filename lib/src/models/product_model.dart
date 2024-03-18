import 'package:store_api_consume/src/models/products_model.dart';

class ProductModel {
  List<ProductsModel> products;
  final int total;
  final int skip;
  final int limit;

  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final produts = List.from(json['products']);

    return ProductModel(
      products: produts.map((e) => ProductsModel.fromJson(e)).toList(),
      total: json['total'] ?? 0,
      skip: json['skip'] ?? 0,
      limit: json['limit'] ?? 0,
    );
  }
}
