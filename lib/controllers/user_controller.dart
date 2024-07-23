import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/user_model.dart';
import '../service/toast_service.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  // Observable to hold user data
  var user = Rx<User?>(null);
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser(1); // Fetch user with id 1 on initialization
  }

  final ToastService _toastService = ToastService();

  Future<void> fetchUser(int userId) async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/users/$userId'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        user.value = User.fromJson(jsonResponse);
      } else {
        final message = 'Failed to load user: ${response.statusCode}';
        errorMessage.value = message;
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
    print("Fetched user: ${user.value}");
  }
}