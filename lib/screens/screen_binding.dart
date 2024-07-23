

import 'package:get/get.dart';
import 'package:tezda_task_project/controllers/bottom_nav_controller.dart';
import 'package:tezda_task_project/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

// class RegistrationBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SignupController>(() => SignupController());
//   }
// }

class BottomNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BottomNavController>(BottomNavController(), permanent: true);
  }
}

