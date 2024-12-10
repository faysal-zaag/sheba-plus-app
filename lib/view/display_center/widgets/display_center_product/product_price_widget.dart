import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/display_service/display_service_product.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/display_center/controller/display_service_controller.dart';

class ProductPriceWidget extends StatelessWidget {
  final DisplayServiceProduct product;

  ProductPriceWidget({Key? key, required this.product}) : super(key: key);

  final displayServiceProductController =
      Get.find<DisplayCenterServiceController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          product.discountPrice > 0
              ? Text(
                  '\$ ${displayServiceProductController.calculatePriceAfterDiscount(price: product.price, discountPrice: product.discountPrice)}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                )
              : Text(
                  '\$ ${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
          if (product.discountPrice > 0) ...[
            5.kW,
            Text(
              '\$ ${product.price}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.grey),
            ),
          ],
          5.kW,
          Text(
            '${product.discountPercentage}% off',
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
