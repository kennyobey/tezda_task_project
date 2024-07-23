import 'dart:convert';
import 'package:get/get.dart';
import 'package:tezda_task_project/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:tezda_task_project/service/toast_service.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();

  // Observable list to hold products
  var productsList = <Product>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print("-==-==-==-=");
    fetchProducts();
  }
  final ToastService _toastService = ToastService();
  Future<void> fetchProducts() async {
  print("+=====+"); // This should show up if the method is called

  
  isLoading(true);

  try {
    // Make the HTTP GET request
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
     
      List<dynamic> jsonResponse = jsonDecode(response.body);
     
      productsList.value = jsonResponse.map((json) => Product.fromJson(json)).toList();

     
      print("Product list fetched: ${productsList.value}");
    } else {
    
      final message = 'Failed to load products: ${response.statusCode}';
      errorMessage.value = message;
      print(message);
      _toastService.error(message);
    }
  } catch (e) {
   
    final errorMessage = 'Network error: $e';
    this.errorMessage.value = errorMessage;
    print(errorMessage);
    _toastService.error(errorMessage);
  } finally {
  
    isLoading(false);
  }


  print("Final product list: ${productsList.value}");
}
}
