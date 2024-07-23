import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/constant.dart/spaces.dart';
import 'package:tezda_task_project/controllers/baseui_controller.dart';
import 'package:tezda_task_project/widgets/text_widget.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    Key? key,
    required this.username,
    required this.rating,
    required this.description,
  }) : super(key: key);

  final String username;
  final double rating;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.lightGrey2,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: username,
            color: AppColors.primaryBlack,
            size: 14,
            weight: FontWeight.w600,
          ),
          verticalSpace(5.0),
          RatingBarIndicator(
            rating: rating,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: AppColors.primaryOrange,
            ),
            itemCount: 5,
            itemSize: 20.0,
            direction: Axis.horizontal,
          ),
          verticalSpace(5.0),
          CustomText(
            title: description,
            color: AppColors.primaryGray3,
            size: 12,
            weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
