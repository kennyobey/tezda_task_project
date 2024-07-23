

import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:tezda_task_project/widgets/product_widget.dart';

import '../model/product_model.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> productList;
  final double minItemWidth;
  final int maxItemsPerRow;
  final bool smallItem;

  const ProductGrid({
    super.key,
    required this.productList,
    this.minItemWidth = 50,
    this.maxItemsPerRow = 2,
    this.smallItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      listViewBuilderOptions: ListViewBuilderOptions(
        shrinkWrap: true,
        primary: false,
      ),
      minItemWidth: minItemWidth,
      maxItemsPerRow: maxItemsPerRow,
      children: productList.map((product) {
        return  ProductWidget(product: product);
      }).toList(),
    );
  }
}



