import 'package:flutter/material.dart';
import 'package:sheba_plus/models/shopping-details/shopping_details.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/services/partial_checkout_texts.dart';

class FinalCheckoutOrderSummary extends StatelessWidget {
  final List<ShoppingDetails> shoppingDetails;
  const FinalCheckoutOrderSummary({super.key, required this.shoppingDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: AppPaddings.allPadding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(PartialCheckoutTexts.orderSummary, style: Theme.of(context).textTheme.headlineSmall,),
          // ...shoppingDetails.shoppingItemDetailsList.map((item) => FinalCheckoutOrderSummaryItem(shoppingItemDetails: item)),
        ],
      ),
    );
  }
}
