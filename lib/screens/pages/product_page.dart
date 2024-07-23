import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/constant.dart/spaces.dart';
import 'package:tezda_task_project/controllers/product_controller.dart';
import 'package:tezda_task_project/model/product_model.dart';
import 'package:tezda_task_project/widgets/reviews_widget.dart';
import 'package:tezda_task_project/widgets/text_widget.dart';
import '../../util/helpers.dart';
import '../../widgets/appBar.dart';
import '../../widgets/button_widget.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage({super.key, required this.product});

  final ProductController productController = ProductController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const AppBarWidget(
        title: "Product Details",
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  bottom: 100,
                  right: 200,
                  child: Container(
                    height: 20,
                    width: 30,
                    color: AppColors.primaryOrange,
                  ),
                ),
                SizedBox(
                  height: 375,
                  width: Get.width,
                  child: FadeInImage.assetNetwork(
                    placeholder: cupertinoActivityIndicator,
                    image: product.image,
                    placeholderScale: 5,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            verticalSpace(8.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: product.title,
                      color: AppColors.primaryBlack,
                      size: 15,
                      weight: FontWeight.w500,
                    ),
                    verticalSpace(5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: "₦ ${Utils.currencyFormat(product.price)}",
                          color: AppColors.primaryOrange,
                          size: 24,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    CustomText(
                      title: "Categories: ${product.category.toUpperCase()} ",
                      color: AppColors.primaryGray3,
                      size: 12,
                      weight: FontWeight.w500,
                    ),
                    verticalSpace(5.0),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: AppColors.primaryOrange,
                          size: 20,
                        ),
                        horizontalSpaceTiny,
                        Expanded(
                          child: CustomText(
                            title:
                                "Shop Address : 24 Ilupeju street, Ojuelegba, Lagos State: ",
                            color: AppColors.primaryGray3,
                            size: 12,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(12.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 58,
                            width: 158,
                            decoration: BoxDecoration(
                              color: AppColors.primaryOrange,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.call,
                                  color: AppColors.primaryWhite,
                                  size: 24,
                                ),
                                horizontalSpaceSmall,
                                CustomText(
                                  title: "Call ",
                                  color: AppColors.primaryWhite,
                                  size: 16,
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                        horizontalSpaceTiny,
                        Expanded(
                          child: Container(
                            height: 58,
                            width: 158,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primaryOrange,
                              ),
                              color: AppColors.primaryWhite,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mail_outline,
                                  color: AppColors.primaryOrange,
                                  size: 24,
                                ),
                                horizontalSpaceTiny,
                                CustomText(
                                  title: "Message ",
                                  color: AppColors.primaryOrange,
                                  size: 16,
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomText(
                title: "Description",
                color: AppColors.primaryBlack,
                size: 18,
                weight: FontWeight.w600,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Container(
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CustomText(
                  title: product.description,
                  color: AppColors.primaryGray3,
                  size: 12,
                  weight: FontWeight.w400,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomText(
                title: "Reviews",
                color: AppColors.primaryBlack,
                size: 18,
                weight: FontWeight.w600,
              ),
            ),
            verticalSpace(10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const ReviewWidget(
                    username: "John Doe",
                    rating: 4.5,
                    description: "Great product! Highly recommend.",
                  ),
                  verticalSpace(10.0),
                  const ReviewWidget(
                    username: "Jane Smith",
                    rating: 4.0,
                    description: "Very good quality, will buy again.",
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  CustomFillButton(
                    onTap: () {},
                    buttonText: "Buy Now",
                    borderRadius: BorderRadius.circular(8),
                    buttonColor: AppColors.primaryOrange,
                    textColor: AppColors.primaryWhite,
                    textSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  verticalSpace(10),
                  CustomFillButton(
                    onTap: () {},
                    buttonText: "Add to Cart",
                    buttonColor: AppColors.primaryWhite,
                    borderRadius: BorderRadius.circular(8),
                    textColor: AppColors.primaryOrange,
                    textSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
