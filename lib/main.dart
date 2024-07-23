
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task_project/screens/startup/splash_screen.dart';
import 'core/bindings/app_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: AppBinding(), // Set up dependencies
      home: const SplashScreen(),
    );
  }
}
