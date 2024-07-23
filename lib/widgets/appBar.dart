import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/widgets/text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? verticalPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onPressed;

  const AppBarWidget(
      {super.key,
      required this.title,
      this.suffixIcon,
      this.onPressed,
      this.prefixIcon,
      this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10, vertical: verticalPadding ?? 0),
      child: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomText(
          title: title,
          size: 18,
          weight: FontWeight.w700,
          color: AppColors.primaryBlack,
        ),
        leading: prefixIcon ??
            InkWell(
                onTap: onPressed ??
                    () {
                      Get.back();
                    },
                child: const Icon(Icons.arrow_back_ios)),
        actions: [suffixIcon ?? const SizedBox()],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
