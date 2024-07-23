import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/constant.dart/spaces.dart';
import 'package:tezda_task_project/constant.dart/validator.dart';
import 'package:tezda_task_project/screens/authentication/login_page.dart';
import 'package:tezda_task_project/widgets/appBar.dart';
import 'package:tezda_task_project/widgets/button_widget.dart';
import 'package:tezda_task_project/widgets/text_field_widget.dart';
import 'package:tezda_task_project/widgets/text_widget.dart';

import '../../controllers/sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const AppBarWidget(
        title: "Sign Up",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
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
                          title: 'Welcome',
                          color: AppColors.primaryBlack,
                          size: 22,
                          weight: FontWeight.w700,
                        ),
                        CustomText(
                          title: 'Create a new account',
                          color: Colors.grey.withOpacity(0.9),
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(15),
                const CustomText(
                  title: 'Email ',
                  color: AppColors.primaryBlack,
                  size: 14,
                  weight: FontWeight.w500,
                ),
                verticalSpaceSmall,
                CustomTextField(
                  textEditingController: controller.emailController,
                  hint: "Enter email ",
                  hintColor: AppColors.primaryGray3.withOpacity(0.3),
                  validate: (value) => Validator.validateEmail(value),
                ),
                verticalSpace(15),
                const CustomText(
                  title: 'User Name ',
                  color: AppColors.primaryBlack,
                  size: 14,
                  weight: FontWeight.w500,
                ),
                verticalSpaceSmall,
                CustomTextField(
                  textEditingController: controller.usernameController,
                  hint: "Enter User Name ",
                  hintColor: AppColors.primaryGray3.withOpacity(0.3),
                  validate: (value) => Validator.validateName(value),
                ),
                verticalSpace(15),
                const CustomText(
                  title: 'Address ',
                  color: AppColors.primaryBlack,
                  size: 14,
                  weight: FontWeight.w500,
                ),
                verticalSpaceSmall,
                CustomTextField(
                  textEditingController: controller.addressController,
                  hint: "Enter Address ",
                  hintColor: AppColors.primaryGray3.withOpacity(0.3),
                  validate: (value) => Validator.validateName(value),
                ),
                verticalSpace(15),
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
                    validate: (value) => Validator.validatePassword(value),
                    suffixIcon: GestureDetector(
                      onTap: controller.toggleShowPassword,
                      child: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.primaryGray3,
                      ),
                    ),
                  );
                }),
                verticalSpaceMedium,
                CustomFillButton(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.formKey.currentState!.save();
                      controller.signup(controller.createUser());
                    }
                  },
                  buttonText: 'Sign Up',
                ),
                verticalSpaceMedium,
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account ",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: AppColors.primaryBlack,
                            fontSize: 14,
                          ),
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Log In",
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                  color: AppColors.primaryOrange,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offAll(() => const LoginPage());
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
      ),
    );
  }
}
