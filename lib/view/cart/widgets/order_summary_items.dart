import 'package:flutter/material.dart';
import 'package:sheba_plus/data/mock_data.dart';
import 'package:sheba_plus/models/product/product.model.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/extensions.dart';

import 'order_summary_item.dart';

class OrderSummaryItems extends StatelessWidget {
  final List<ProductModel> productList;

  const OrderSummaryItems({super.key, required this.productList});

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
        ...productList.mapWithIndex((index, product) => OrderSummaryItem(
              product: product,
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
                      text: ' (18 items)',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: AppColors.primary),
                    ),
                  ]),
            ),
            Text(
              'CAD ${product.price}',
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
              'Item Price in CAD',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'CAD 19',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ],
    );
  }
}
