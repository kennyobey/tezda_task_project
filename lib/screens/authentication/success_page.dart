import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tezda_task_project/constant.dart/spaces.dart';
import 'package:tezda_task_project/widgets/text_widget.dart';

import '../../constant.dart/colors.dart';
import 'login_page.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({
    super.key,
  });

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Padding(
        padding: EdgeInsets.only(
            left: Get.width * 0.04,
            right: Get.width * 0.04,
            top: Get.height * 0.07,
            bottom: Get.height * 0.03),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //  height: 320,
                color: AppColors.primaryWhite,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "asset/svgs/success_icon.svg",
                      height: 300,
                      width: 300,
                    ),
                    //Gap(Get.height * 0.00),

                    const CustomText(
                      textAlign: TextAlign.center,
                      title:
                          'Congratulations, your account has been created succefully. Thanks',
                      color: AppColors.primaryBlack,
                      size: 15,
                      weight: FontWeight.w500,
                    ),
                    verticalSpaceMedium,
                    InkWell(
                      onTap: () {
                        Get.offAll(() => const LoginPage());
                      },
                      child: Container(
                        height: 50,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryOrange,
                        ),
                        child: const Center(
                            child: CustomText(
                          title: 'Continue',
                          color: AppColors.primaryWhite,
                          weight: FontWeight.w600,
                          size: 16,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
