import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task_project/constant.dart/spaces.dart';

import '../../constant.dart/colors.dart';
import '../../constant.dart/validator.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/appBar.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';

class EditProfile extends GetView<UserController> {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const AppBarWidget(
        title: "Edit Profile",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomTextField(
                textEditingController: controller.usernameController,
                hint: "Enter User Name ",
                hintColor: AppColors.primaryGray3.withOpacity(0.3),
                validate: (value) => Validator.validateName(value),
              ),
              verticalSpaceMedium,
              CustomTextField(
                textEditingController: controller.addressController,
                hint: "Enter City ",
                hintColor: AppColors.primaryGray3.withOpacity(0.3),
                validate: (value) => Validator.validateName(value),
              ),
              verticalSpaceMedium,
              CustomTextField(
                textEditingController: controller.passwordController,
                hint: "Enter Password ",
                hintColor: AppColors.primaryGray3.withOpacity(0.3),
                validate: (value) => Validator.validateName(value),
              ),
              verticalSpaceMedium,
              CustomTextField(
                textEditingController: controller.emailController,
                hint: "Enter email ",
                hintColor: AppColors.primaryGray3.withOpacity(0.3),
                validate: (value) => Validator.validateEmail(value),
              ),
              verticalSpaceMedium,
              Obx(() {
                return CustomFillButton(
                  onTap: controller.isLoading.value
                      ? null
                      : () {
                          if (controller.formKey.currentState?.validate() ??
                              false) {
                            controller.updateUserProfile(
                              email: controller.emailController.text,
                              password: controller.passwordController.text,
                              username: controller.usernameController.text,
                              city: controller.addressController.text,
                            );
                          }
                        },
                  buttonText: 'Update',
                  isLoading: controller.isLoading.value,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
