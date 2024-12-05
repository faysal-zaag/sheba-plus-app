import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/services/agent-shopping/agent_shopping_texts.dart';
import 'package:sheba_plus/view/services/widget/shopping-details/shopping_details_row.dart';
import 'package:sheba_plus/view/services/widget/summary_row.dart';

class ShoppingDetails extends StatelessWidget {
  const ShoppingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTextStyle = Theme.of(context)
        .textTheme
        .titleSmall;
    final subTextStyle = Theme.of(context)
        .textTheme
        .titleSmall
        ?.copyWith(color: AppColors.hintText);
    return Container(
      color: AppColors.background2,
      padding: AppPaddings.allPadding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AgentShoppingTexts.shopName,
            style: subTextStyle,
          ),
          Text(
            "Arong",
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
          const ShoppingDetailsRow(
              title1: "Cotton T-shirt",
              title2: "1",
              title3: "BDT 120",
              title4: "BDT 850"),
          6.kH,
          const ShoppingDetailsRow(
              title1: "Cotton T-shirt",
              title2: "1",
              title3: "BDT 120",
              title4: "BDT 850"),
          6.kH,
          const ShoppingDetailsRow(
              title1: "Cotton T-shirt",
              title2: "1",
              title3: "BDT 120",
              title4: "BDT 850"),
          const Divider(),
          SummaryRow(
              title: AgentShoppingTexts.totalItemPrice, value: "BDT 12000"),
          24.kH,
          SummaryRow(
            title: AgentShoppingTexts.totalShoppingCost,
            customValue: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(AgentShoppingTexts.totalItemPrice, style: subTextStyle,),
                4.kH,
                const Text("BDT 12000"),
                4.kH,
                Row(
                  children: [
                    Text("(1CAD=120BDT)", style: subTextStyle,),
                    Text(" CAD 150", style: lightTextStyle,),
                  ],
                ),
              ],
            ),
            value: "",
          ),
        ],
      ),
    );
  }
}
