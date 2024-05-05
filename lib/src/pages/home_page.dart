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
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Text(
                            productOnly.title,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Image.network(
                            productOnly.thumbnail,
                            height: 170,
                            width: 200,
                            fit: BoxFit.fill,
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
