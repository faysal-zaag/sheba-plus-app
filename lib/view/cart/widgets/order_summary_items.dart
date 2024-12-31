import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/cart/cart_details.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';
import 'package:sheba_plus/utils/extensions.dart';
import 'package:sheba_plus/view/cart/controller/cart_controller.dart';

import 'order_summary_item.dart';

class OrderSummaryItems extends StatelessWidget {
  final List<CartDetails> cartDetailsList;

  OrderSummaryItems({super.key, required this.cartDetailsList});

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        20.kH,
        ...cartDetailsList
            .mapWithIndex((index, cartDetails) => OrderSummaryItem(
                  product: cartDetails.product,
                  quantity: cartDetails.quantity,
                )),
        10.kH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                  text: 'Sub total',
                  style: Theme.of(context).textTheme.labelMedium,
                  children: [
                    TextSpan(
                      text: ' (${cartDetailsList.length})',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: AppColors.primary),
                    ),
                  ]),
            ),
            Text(
              '\$ ${cartController.subTotal.value}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        5.kH,
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Item Price in \$',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              '\$ ${cartController.subTotal.value}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        5.kH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping cost',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'Pending',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.error),
            ),
          ],
        ),
        5.kH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Drop-off cost',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'Pending',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.error),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              '\$ 0.00',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: AppColors.primary),
            ),
          ],
        ),
        10.kH,
        const Divider()
      ],
    );
  }
}
