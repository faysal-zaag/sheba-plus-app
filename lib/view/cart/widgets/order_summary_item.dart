import 'package:flutter/material.dart';
import 'package:sheba_plus/models/product/product.model.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

class OrderSummaryItem extends StatelessWidget {
  final ProductModel product;

  const OrderSummaryItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.name}',
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                5.kH,
                Row(
                  children: [
                    //TODO implement for dynamic quantity
                    Text(
                      '2 x',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.green),
                    ),
                    5.kW,
                    Text(
                      'CAD ${(product.price ?? 0) * 2}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'CAD ${product.price}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
