

import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../controllers/product_controller.dart';
import '../../controllers/sign_up_controller.dart';
import '../../controllers/user_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Register controllers
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<SignUpController>(SignUpController(), permanent: true);
    Get.put<ProductController>(ProductController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
  }
}

