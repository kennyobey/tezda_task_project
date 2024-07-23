import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';
import '../screens/pages/edit_profile.dart';
import '../service/toast_service.dart'; // Replace with your actual import

class UserController extends GetxController {
  static UserController get to => Get.find();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  void clear() {
    passwordController.clear();
    usernameController.clear();
    addressController.clear();
    emailController.clear();
  }

  // Observable to hold user data
  var user = Rx<User?>(null);
  var isLoading = false.obs; // Changed to false initially
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser(1); // Fetch user with id 1 on initialization
  }

  final formKey = GlobalKey<FormState>();
  final ToastService _toastService = ToastService();

  // Fetch user data
  Future<void> fetchUser(int userId) async {
    isLoading(true);
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/users/$userId'));

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

  // Update user profile
  Future<void> updateUserProfile({
    required String email,
    required String password,
    required String username,
    required String city,
  }) async {
    if (user.value == null) {
      _toastService.error('User data not available');
      return;
    }

    const userId = 1; // Assuming the User model has an 'id' field
    final url = Uri.parse('https://fakestoreapi.com/users/$userId');

    // Construct the request body
    final updatedUser = {
      'email': email,
      'username': username,
      'password': password,
      'address': {
        'city': city,
      },
    };

    isLoading(true); // Start loading
    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(updatedUser),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        user.value = User.fromJson(jsonResponse); // Update user data
        _toastService.success('Profile updated successfully');
        clear();
        Get.back();
      } else {
        final message = 'Failed to update profile: ${response.statusCode}';
        errorMessage.value = message;
        _toastService.error(message);
      }
    } catch (e) {
      final errorMessage = 'Network error: $e';
      this.errorMessage.value = errorMessage;
      print(errorMessage);
      _toastService.error(errorMessage);
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
