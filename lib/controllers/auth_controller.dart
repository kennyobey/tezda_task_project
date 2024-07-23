// import 'dart:convert';

// import 'package:get/get.dart';

// class AuthController extends GetxController {

//   Future<void> loginUser(Map<String, dynamic> fields) async {
//     final response = await apiService.post("/auth", jsonEncode(fields));
//     if (response.status.isOk) {
//       //setLoggedInUser(response.body);
//       loadDefaultControllers();
//       return;
//     }

//     handleError(response);
//     throw Exception("Invalid credentials");
//   }

//   Future<Map<String, dynamic>> registerUser(Map<String, dynamic> fields) async {
//     final response = await apiService.post("/auth/register", jsonEncode(fields));
//     if (response.statusCode == 201) {
//       return response.body;
//     }

//     handleError(response);
//     throw Exception("Error creating an account");
//   }

//   Future<void> verifyUser(Map<String, dynamic> fields) async {
//     final response = await apiService.post("/auth/activate", fields);
//     if (response.status.isOk) {
//       setLoggedInUser(response.body);
//       loadDefaultControllers();
//       return;
//     }

//     handleError(response);
//     throw Exception("Invalid verification code");
//   }

//   void loadDefaultControllers() {
//     Get.put(UserController(), permanent: true);
//     Get.put(ShopController(), permanent: true);
//   }
// }