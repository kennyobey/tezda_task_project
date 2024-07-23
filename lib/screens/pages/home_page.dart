import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/constant.dart/spaces.dart';
import 'package:tezda_task_project/widgets/responsive_grid.dart';
import '../../controllers/product_controller.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/appBar.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController productController = ProductController.to;
  final UserController userController = UserController.to;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching =
      false; // Boolean variable to manage search field visibility

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      productController.filterProducts(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = userController.user.value!;
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const AppBarWidget(
        title: "HomePage",
        prefixIcon: SizedBox(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryOrange),
                      color: Colors.white),
                  clipBehavior: Clip.hardEdge,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: const CircleAvatar(
                      radius: 50,
                    ),
                  ),
                ),
                horizontalSpaceSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: user.username,
                      color: AppColors.primaryBlack,
                      size: 18,
                      weight: FontWeight.w400,
                    ),
                    CustomText(
                      title: user.email,
                      color: AppColors.primaryBlack,
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey2,
                      borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearching =
                            !_isSearching; // Toggle search field visibility
                      });
                    },
                    icon: Icon(
                      _isSearching ? Icons.close : Icons.search,
                      color: AppColors.primaryGray3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isSearching) // Conditionally display search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: CustomTextField(
                borderColor: AppColors.inputTextFill,
                textEditingController: _searchController,
                hint: "Search products...",
                hintColor: AppColors.primaryGray3.withOpacity(0.3),
                validate: (value) => null, // No validation for search input
              ),
            ),
          Expanded(
            child: Obx(() {
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

              if (productController.filteredProducts.isEmpty) {
                return const Center(
                  child: Text(
                    'There is no product',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: productController.fetchProducts,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16.0),
                  child: Column(
                    children: [
                      ProductGrid(
                        minItemWidth: 80,
                        productList: productController.filteredProducts,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
