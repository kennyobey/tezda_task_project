import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tezda_task_project/controllers/baseui_controller.dart';
import 'package:tezda_task_project/screens/authentication/login_page.dart';
import 'package:tezda_task_project/screens/pages/home_page.dart';
import 'package:tezda_task_project/service/toast_service.dart';
import '../routes/pages.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends BaseUiController {
  //final authController = Get.find<AuthController>();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final canSubmit = false.obs;
  final hidePassword = true.obs;

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  final formKey = GlobalKey<FormState>();

  void onLoginPressed() async {
    if (formKey.currentState!.validate()) {
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();

      setBusy(true);
      await login(username, password);
      setBusy(false);
    }
  }

  final ToastService _toastService = ToastService();
  void toggleShowPassword() => hidePassword.value = !hidePassword.value;

  Future<void> login(String username, String password) async {
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': username,
      'password': password,
    });

    setBusy(true);

    try {
      final response = await http.post(
        Uri.parse('https://fakestoreapi.com/auth/login'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (kDebugMode) {
          print(jsonResponse);
        }
        _toastService.success('Login successful');

        final token = jsonResponse['token'];
        print("Token is ${token}");
        //await _secureStorage.write(key: 'auth_token', value: token);

        Get.offAll(() =>  HomePage());
      } else {
        final jsonResponse = jsonDecode(response.body);
        final message = jsonResponse['message'] ?? 'Failed to login';
        _toastService.error('Failed to login: $message');
      }
    } catch (e) {
      _toastService.error('Network error: $e');
      print(e);
    } finally {
      setBusy(false);
    }
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'auth_token');
    Get.offAll(() => const LoginPage());
  }

  Future<void> autoLogin() async {
    final token = await getToken();
    if (token != null) {
      // Optionally: Verify token with server
      Get.offAll(() =>  HomePage());
    } else {
      Get.offAll(() => const LoginPage());
    }
  }
}
