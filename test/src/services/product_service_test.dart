import 'package:flutter_test/flutter_test.dart';
import 'package:store_api_consume/src/services/product_service.dart';

void main() {
  test('product service ...', () async {
    final result = ProductService();
    await result.getProduct();
    // ignore: avoid_print
    print(result);
  });
}
