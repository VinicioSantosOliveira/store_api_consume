import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_api_consume/src/controller/home_controller.dart';
import 'package:store_api_consume/src/models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

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
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
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
          final List<ProductModel> product = state;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 500,
              width: double.infinity,
              child: ListView.builder(
                itemCount: product.length,
                itemBuilder: (_, index) {
                  final productOnly = product[index];

                  return Text(productOnly.products.first.title);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
