import 'package:flutter/material.dart';
import 'package:sheba_plus/models/display_service/display_service_product.dart';
import 'package:sheba_plus/models/product/product.model.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

class ProductPriceWidget extends StatelessWidget {
  final DisplayServiceProduct product;

  const ProductPriceWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            '\$ ${product.price}',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          5.kW,
          Text(
            '\$ ${product.price}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.grey,
                decoration: TextDecoration.lineThrough,
                decorationColor: AppColors.grey),
          ),
          5.kW,
          Text(
            '25% off',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.error),
          ),
        ],
      ),
    );
  }
}
