import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tezda_task_project/controllers/baseui_controller.dart';
import 'package:tezda_task_project/screens/authentication/success_page.dart';
import 'package:tezda_task_project/service/toast_service.dart';
import '../model/user_model.dart';
import 'package:http/http.dart' as http;

import '../util/app_constants.dart';

class SignUpController extends BaseUiController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  final canSubmit = false.obs;
  final hidePassword = true.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void toggleShowPassword() => hidePassword.value = !hidePassword.value;

  final ToastService _toastService = ToastService();

  User createUser() {
    return User(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      username: usernameController.text.trim(),
      city: addressController.text.trim(),
    );
  }

  void clear() {
    passwordController.clear();
    passwordController.clear();
    usernameController.clear();
    addressController.clear();
  }

  Future<void> signup(User user) async {
    final headers = {'Content-Type': 'application/json'};

    setBusy(true);

    try {
      final response = await http.post(
        Uri.parse(ApiLink.user),
        headers: headers,
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (kDebugMode) {
          print(jsonResponse);
        }
        _toastService.success('User registered successfully');
        Get.offAll(() => const SuccessPage());
        clear();
      } else {
        final jsonResponse = jsonDecode(response.body);
        final message = jsonResponse['message'] ?? 'Failed to register';
        _toastService.error('Failed to register: $message');
      }
    } catch (e) {
      _toastService.error('Network error: $e');
    } finally {
      setBusy(false);
    }
  }
}
