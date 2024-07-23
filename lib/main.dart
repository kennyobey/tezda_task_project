import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task_project/controllers/product_controller.dart';
import 'package:tezda_task_project/screens/startup/splash_screen.dart';

import 'controllers/login_controller.dart';
import 'controllers/sign_up_controller.dart';
import 'controllers/user_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ProductController());
  Get.put(LoginController());
  Get.put(SignUpController());
  Get.put(UserController());

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
