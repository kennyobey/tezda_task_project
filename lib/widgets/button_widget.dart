import 'package:flutter/material.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/widgets/text_widget.dart';

class CustomFillButton extends StatelessWidget {
  const CustomFillButton({
    super.key,
    this.onTap,
    this.width,
    this.textColor,
    this.buttonColor,
    this.borderRadius,
    this.isLoading = false,
    required this.buttonText,
    this.boarderColor,
    this.height,
    this.textSize,
    this.fontWeight,
  });
  final double? width;
  final double? height;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? buttonColor;
  final Color? boarderColor;
  final String? buttonText;
  final VoidCallback? onTap;
  final BorderRadiusGeometry? borderRadius;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 45,
        decoration: BoxDecoration(
            color: buttonColor ?? AppColors.primaryOrange,
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            border: Border.all(color: boarderColor ?? AppColors.primaryOrange)),
        child: Center(
          child: (isLoading)
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : CustomText(
                  title: buttonText!,
                  size: textSize ?? 16,
                  weight: fontWeight ?? FontWeight.w600,
                  textAlign: TextAlign.center,
                  color: textColor ?? AppColors.primaryWhite,
                ),
        ),
      ),
    );
  }
}
