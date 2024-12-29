import 'package:flutter/material.dart';
import 'package:sheba_plus/models/display_service/display_service_product.dart';

/**
 * Created by mahabub on 24/12/24.
 * Author: Mahabub Shozib
 */

class ProductCategoryListWidget extends StatelessWidget {
  final DisplayCenterProduct displayCenterProduct;

  const ProductCategoryListWidget(
      {super.key, required this.displayCenterProduct});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(displayCenterProduct.subCategoryList!.length == 1)
        ...displayCenterProduct.subCategoryList!.map(
          (cat) => Text(
            cat.name,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        if(displayCenterProduct.subCategoryList!.length > 1)
          ...displayCenterProduct.subCategoryList!.map(
                (cat) => Text(
              '${cat.name}, ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          )
      ],
    );
  }
}
