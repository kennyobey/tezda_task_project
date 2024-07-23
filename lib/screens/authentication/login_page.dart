import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/constant.dart/spaces.dart';
import 'package:tezda_task_project/constant.dart/validator.dart';
import 'package:tezda_task_project/screens/authentication/sign_page.dart';
import 'package:tezda_task_project/widgets/appBar.dart';
import 'package:tezda_task_project/widgets/button_widget.dart';
import 'package:tezda_task_project/widgets/text_field_widget.dart';
import 'package:tezda_task_project/widgets/text_widget.dart';
import '../../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const AppBarWidget(
        title: "Log In",
         prefixIcon: SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        title: 'Login',
                        color: AppColors.primaryBlack,
                        size: 22,
                        weight: FontWeight.w700,
                      ),
                      CustomText(
                        title: 'Welcome back to your account',
                        color: Colors.grey.withOpacity(0.9),
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(20),
              const CustomText(
                title: 'Username ',
                color: AppColors.primaryBlack,
                size: 14,
                weight: FontWeight.w500,
              ),
              verticalSpaceSmall,
              CustomTextField(
                textEditingController: controller.usernameController,
                hint: "Enter email ",
                hintColor: AppColors.primaryGray3.withOpacity(0.3),
                validate: (value) => Validator.validateName(value),
              ),
              verticalSpace(20),
              const CustomText(
                title: 'Password ',
                color: AppColors.primaryBlack,
                size: 14,
                weight: FontWeight.w500,
              ),
              verticalSpaceSmall,
              Obx(() {
                return CustomTextField(
                  textEditingController: controller.passwordController,
                  hint: "Password",
                  hintColor: AppColors.primaryGray3.withOpacity(0.3),
                  obscure: controller.hidePassword.value,
                  validate: (value) => Validator.validateName(value),
                  suffixIcon: GestureDetector(
                    onTap: controller.toggleShowPassword,
                    child: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.primaryGray3,
                    ),
                  ),
                );
              }),
              const Spacer(),
              Obx(() {
                return CustomFillButton(
                  onTap: controller.isBusy ? null : controller.onLoginPressed,
                  buttonText: 'Login',
                  isLoading: controller.isBusy,
                );
              }),
              verticalSpaceSmall,
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account ",
                    style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: AppColors.primaryBlack,
                          fontSize: 14,
                        ),
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Sign up",
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                color: AppColors.primaryOrange,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offAll(() => const SignUpPage());
                            })
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
