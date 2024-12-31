import 'package:flutter/material.dart';
import 'package:sheba_plus/models/shopping-details/shopping_details.dart';
import 'package:sheba_plus/services/product_services.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';

class FinalCheckoutOrderSummaryItem extends StatelessWidget {
  final ShoppingItemDetails shoppingItemDetails;
  const FinalCheckoutOrderSummaryItem({super.key, required this.shoppingItemDetails});

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
                  shoppingItemDetails.name,
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                8.kH,
                Row(
                  children: [
                    //TODO implement for dynamic quantity
                    Text(
                      '${shoppingItemDetails.quantity} x',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.green),
                    ),
                    5.kW,
                    Text(
                      'CAD ${ProductServices.getAmount(price: shoppingItemDetails.price)}',
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
                'CAD ${ProductServices.getAmount(price: shoppingItemDetails.price * shoppingItemDetails.quantity)}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
