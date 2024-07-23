import 'dart:convert';
import 'package:get/get.dart';
import 'package:tezda_task_project/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../service/toast_service.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();

  var productsList = <Product>[].obs;
  var favoriteProducts = <Product>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  final ToastService _toastService = ToastService();

  Future<void> fetchProducts() async {
    isLoading(true);
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        productsList.value =
            jsonResponse.map((json) => Product.fromJson(json)).toList();
        print("Product list fetched: ${productsList.value}");
      } else {
        final message = 'Failed to load products: ${response.statusCode}';
        errorMessage.value = message;
        _toastService.error(message);
      }
    } catch (e) {
      final errorMessage = 'Network error: $e';
      this.errorMessage.value = errorMessage;
      _toastService.error(errorMessage);
    } finally {
      isLoading(false);
    }
    print("Final product list: ${productsList.value}");
  }

  void toggleFavorite(Product product) {
    final index = productsList.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      productsList[index].isFavorite = !productsList[index].isFavorite;
      productsList.refresh();

      if (productsList[index].isFavorite) {
        // Move the liked product to the top of the favorites list
        favoriteProducts.removeWhere((p) => p.id == product.id);
        favoriteProducts.insert(0, productsList[index]);
      } else {
        favoriteProducts.removeWhere((p) => p.id == product.id);
      }
    }
  }
}
