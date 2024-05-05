import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_api_consume/src/controller/home_controller.dart';
import 'package:store_api_consume/src/models/product_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Produtos',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 17, 0),
            shadows: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(-3, 1),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[600],
      ),
      body: homeController.obx(
        (state) {
          final ProductModel product = state;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: ListView.builder(
                itemCount: product.products.length,
                itemBuilder: (_, index) {
                  final productOnly = product.products[index];

                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      productOnly.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 290),
                                child: Center(
                                  child: Text(
                                    '\$${productOnly.price}',
                                    style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.network(
                            productOnly.thumbnail,
                            height: 170,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                            ),
                            child: Container(
                              height: 80,
                              width: 340,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(productOnly.description),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
