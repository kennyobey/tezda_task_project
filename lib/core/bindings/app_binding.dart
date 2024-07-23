

import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../controllers/product_controller.dart';
import '../../controllers/sign_up_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(), permanent: true);
    Get.put(SignUpController(), permanent: true);
    Get.put(ProductController(), permanent: true);
  }
}

