import 'package:dio/dio.dart';
import 'package:store_api_consume/src/models/product_model.dart';

class ProductService {
  final dio = Dio();

  Future getProduct() async {
    ProductModel productModel;

    final response = await dio.get('https://dummyjson.com/products');

    productModel = ProductModel.fromJson(response.data);

    return productModel;
  }
}
