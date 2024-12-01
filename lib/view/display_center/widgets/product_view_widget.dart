import 'package:flutter/material.dart';
import 'package:sheba_plus/view/components/product_card.dart';

import '../../../models/product/product.model.dart';

class ProductViewWidget extends StatelessWidget {
  final List<ProductModel> productList;
  final Function onTapProduct;

  const ProductViewWidget(
      {super.key, required this.productList, required this.onTapProduct});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisExtent: 320,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: productList.length,
        itemBuilder: (context, index) {
         return GestureDetector(
            onTap: () {
              onTapProduct(productList[index]);
            },
            child: ProductCard(
              productModel: productList[index],
            ),
          );
        },
      ),
    );
  }
}
