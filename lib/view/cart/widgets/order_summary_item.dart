import 'package:flutter/material.dart';
import 'package:sheba_plus/models/display_service/display_service_product.dart';
import 'package:sheba_plus/models/product/product.model.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';

class OrderSummaryItem extends StatelessWidget {
  final DisplayCenterProduct product;
  final int quantity;

  const OrderSummaryItem({super.key, required this.product, required this.quantity});

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
                  product.name,
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                5.kH,
                Row(
                  children: [
                    //TODO implement for dynamic quantity
                    Text(
                      '$quantity x',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.green),
                    ),
                    5.kW,
                    Text(
                      '\$ ${(product.price)}',
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
                '\$ ${(product.price) * quantity}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
