import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/widgets/appBar.dart';
import 'package:tezda_task_project/widgets/responsive_grid.dart';
import '../../controllers/product_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ProductController productController = ProductController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const AppBarWidget(
        title: "HomePage",
        prefixIcon: SizedBox(),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primaryOrange), // Customize color if needed
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

        return RefreshIndicator(
          onRefresh: productController.fetchProducts,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
            child: Column(
              children: [
                ProductGrid(
                  minItemWidth: 80,
                  productList: productController.productsList,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
