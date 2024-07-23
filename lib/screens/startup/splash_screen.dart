import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/constant.dart/spaces.dart';
import 'package:tezda_task_project/screens/authentication/login_page.dart';
import '../../widgets/text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  void route() {
    Get.offAll(() =>  LoginPage());
  }
  // route() async {
  //   if (authController.authStatus == AuthStatus.isFirstTime) {
  //     Get.offAll(() => const Onboarding());
  //   } else if (authController.authStatus == AuthStatus.authenticated) {
  //     Get.offAll(() => MyNavigationBar());
  //   } else {
  //     Get.offAll(() => const LoginPage());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(10),
              const CustomText(
                title: "TEDZA",
                size: 30,
                weight: FontWeight.w700,
                textAlign: TextAlign.start,
                color: AppColors.primaryBlack,
              ),
              const Spacer(),
              const CustomText(
                title: "Buy  |  Sell  |  Resell",
                size: 18,
                weight: FontWeight.w700,
                textAlign: TextAlign.start,
                color: AppColors.primaryBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
