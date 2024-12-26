import 'package:flutter/material.dart';
import 'package:sheba_plus/models/setting/config.dart';
import 'package:sheba_plus/models/shopping-details/shopping_details.dart';
import 'package:sheba_plus/services/product_services.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/shopping_details_row.dart';
import 'package:sheba_plus/view/services/agent-shopping/agent_shopping_texts.dart';
import 'package:sheba_plus/view/services/widget/summary_row.dart';

class ShoppingDetailsContainer extends StatelessWidget {
  final ShoppingDetails shoppingDetails;
  final double currentCadRate;

  const ShoppingDetailsContainer({super.key, required this.shoppingDetails, required this.currentCadRate});

  @override
  Widget build(BuildContext context) {
    final lightTextStyle = Theme.of(context).textTheme.titleSmall;
    final subTextStyle = lightTextStyle?.copyWith(color: AppColors.hintText);

    return Container(
      color: AppColors.background2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AgentShoppingTexts.shopName,
            style: subTextStyle,
          ),
          Text(
            shoppingDetails.shopName,
            style: lightTextStyle,
          ),
          16.kH,
          ShoppingDetailsRow(
            title1: AgentShoppingTexts.totalItem,
            title2: AgentShoppingTexts.itemQty,
            title3: AgentShoppingTexts.itemPrice,
            title4: AgentShoppingTexts.totalItemPrice,
            header: true,
          ),
          6.kH,
          ...shoppingDetails.shoppingItemDetailsList.map(
            (shoppingItemDetails) => ShoppingDetailsRow(
              title1: shoppingItemDetails.name,
              title2: shoppingItemDetails.quantity.toString(),
              title3: ProductServices.getAmount(price: shoppingItemDetails.price * currentCadRate),
              title4: ProductServices.getAmount(price: shoppingItemDetails.price * currentCadRate * shoppingItemDetails.quantity),
            ),
          ),
          const Divider(),
          SummaryRow(title: AgentShoppingTexts.totalItemPrice, value: "BDT ${ProductServices.getAmount(price: shoppingDetails.totalItemPrice * currentCadRate)}"),
        ],
      ),
    );
  }
}
