import 'package:dio/dio.dart';
import 'package:store_api_consume/src/models/product_model.dart';

class ProductService {
  final dio = Dio();

  Future<ProductModel> getProduct() async {
    final response = await dio.get('https://dummyjson.com/products');
    final data = response.data;
    final product = ProductModel.fromJson(data);

    return product;
  }
}
