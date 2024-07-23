import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task_project/constant.dart/colors.dart';
import 'package:tezda_task_project/model/product_model.dart';
import 'package:tezda_task_project/widgets/text_widget.dart';
import "package:loading_gifs/loading_gifs.dart";
import '../screens/pages/product_page.dart';
import '../util/helpers.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding: const EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
          color: AppColors.lightGrey2, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10.0),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: FadeInImage.assetNetwork(
                    placeholder: cupertinoActivityIndicator,
                    image: widget.product.image,
                    placeholderScale: 5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 6,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.verified, color: Colors.blue, size: 16),
                      SizedBox(width: 4),
                      CustomText(
                        title: 'Verified',
                        size: 10,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryWhite,
                    ),
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked
                          ? AppColors.primaryOrange
                          : AppColors.primaryOrange,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () => Get.to(() => ProductPage(product: widget.product)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      title: widget.product.title,
                      size: 16,
                      weight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                  CustomText(
                    title: "\$${Utils.currencyFormat(widget.product.price)}",
                    color: AppColors.primaryOrange,
                    size: 14,
                    weight: FontWeight.w700,
                  ),
                  CustomText(
                    title: 'category: ${widget.product.category}',
                    color: AppColors.lightTextGrey,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: CustomText(
                      title: 'See Details ->',
                      color: AppColors.lightTextGrey,
                      size: 10,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
