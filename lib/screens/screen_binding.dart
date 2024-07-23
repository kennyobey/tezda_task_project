

import 'package:get/get.dart';
import 'package:tezda_task_project/controllers/login_controller.dart';

import '../controllers/sign_up_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}




