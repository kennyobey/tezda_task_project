import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/controllers/product_controller.dart';
import 'package:tezda_task_project/widgets/appBar.dart'; // Ensure this is correctly imported
import '../../widgets/responsive_grid.dart'; // Ensure this is correctly imported

class FavouritePage extends StatelessWidget {
  FavouritePage({super.key});

  final ProductController productController = ProductController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const AppBarWidget(
        title: "Favourite Page",
        prefixIcon: SizedBox(),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppColors.primaryOrange),
            ),
          );
        }

        if (productController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              productController.errorMessage.value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (productController.favoriteProducts.isEmpty) {
          return const Center(
            child: Text(
              'No favorites yet.',
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            // Refresh the favorite products list or fetch products if needed
            await productController.fetchProducts();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
            child: Column(
              children: [
                ProductGrid(
                  minItemWidth: 80,
                  productList: productController.favoriteProducts,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
