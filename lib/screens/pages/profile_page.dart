import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tezda_task_project/constant.dart/spaces.dart';
import '../../constant.dart/colors.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/appBar.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import 'edit_profile.dart';


class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final UserController userController = UserController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const AppBarWidget(
        title: "Profile Page",
        prefixIcon: SizedBox(),
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (userController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              userController.errorMessage.value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (userController.user.value == null) {
          return const Center(
            child: Text(
              'No user data',
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        final user = userController.user.value!;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryOrange),
                      color: Colors.white),
                  clipBehavior: Clip.hardEdge,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: CircleAvatar(
                      radius: 50,
                      child: SvgPicture.asset(
                        "aasset/svgs/success_icon.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpaceSmall,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.inputTextFill,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: AppColors.inputTextFill,
                    ),
                    horizontalSpaceTiny,
                    CustomText(
                      title: "Username: ${user.username}",
                      color: AppColors.primaryBlack,
                      size: 15,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              verticalSpaceSmall,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.inputTextFill,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.mail,
                      color: AppColors.inputTextFill,
                    ),
                    horizontalSpaceTiny,
                    CustomText(
                      title: "Mail: ${user.email}",
                      color: AppColors.primaryBlack,
                      size: 15,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              verticalSpaceSmall,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.inputTextFill,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_city,
                      color: AppColors.inputTextFill,
                    ),
                    horizontalSpaceTiny,
                    CustomText(
                      title: "City: ${user.city}",
                      color: AppColors.primaryBlack,
                      size: 15,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              CustomFillButton(
                onTap: () {
                  Get.to(() => const EditProfile());
                },
                buttonText: 'Edit',
              )
            ],
          ),
        );
      }),
    );
  }
}
