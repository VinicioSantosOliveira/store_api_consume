import 'package:get/get.dart';
import 'package:store_api_consume/src/services/product_service.dart';

class HomeController extends GetxController with StateMixin {
  final productsService = ProductService();

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  void getProduct() async {
    change([], status: RxStatus.loading());
    try {
      final products = await productsService.getProduct();
      change(products, status: RxStatus.success());
    } catch (e) {
      change(e.toString(), status: RxStatus.error());
    }
  }
}
