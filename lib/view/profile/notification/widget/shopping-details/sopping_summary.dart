import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/dashed_divider.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/services/agent-shopping/agent_shopping_texts.dart';
import 'package:sheba_plus/view/services/partial_checkout_texts.dart';
import 'package:sheba_plus/view/services/widget/summary_column.dart';
import 'package:sheba_plus/view/services/widget/summary_row.dart';

class ShoppingSummary extends StatelessWidget {
  const ShoppingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTextStyle = Theme.of(context).textTheme.titleSmall;
    final subTextStyle = lightTextStyle?.copyWith(color: AppColors.hintText);

    return Container(
      color: AppColors.background2,
      padding: AppPaddings.allPadding16,
      child: Column(
        children: [
          SummaryRow(
            titleColor: AppColors.black,
            title: AgentShoppingTexts.totalShoppingCost,
            customValue: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  AgentShoppingTexts.totalItemPrice,
                  style: subTextStyle,
                ),
                4.kH,
                const Text("BDT 12000"),
                4.kH,
                Row(
                  children: [
                    Text(
                      "(1CAD=120BDT)",
                      style: subTextStyle,
                    ),
                    Text(
                      " CAD 150",
                      style: lightTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            value: "",
          ),
          12.kH,
          SummaryRow(
            titleColor: AppColors.black,
            title: AgentShoppingTexts.shoppingCost,
            customValue: SummaryColumn(
                title: AgentShoppingTexts.totalItemPrice, value: "CAD 12000"),
          ),
          12.kH,
          SummaryRow(
            titleColor: AppColors.black,
            title: AgentShoppingTexts.tax,
            customValue: SummaryColumn(
                title: AgentShoppingTexts.totalItemPrice, value: "CAD 12000"),
          ),
          12.kH,
          SummaryRow(
            titleColor: AppColors.black,
            title: AgentShoppingTexts.vat,
            customValue: SummaryColumn(
                title: AgentShoppingTexts.totalItemPrice, value: "CAD 12000"),
          ),
          12.kH,
          SummaryRow(
            customTitle: Row(
              children: [
                Text(PartialCheckoutTexts.dropOffServiceTitle),
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.primary,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            value: AgentShoppingTexts.total,
            valueColor: AppColors.hintText,
          ),
          SummaryRow(
            titleColor: AppColors.black,
            title: PartialCheckoutTexts.dropOffService,
            value: "CAD 150",
          ),
          const DashedDivider(),
          12.kH,
          SummaryRow(
            titleColor: AppColors.black,
            title: AgentShoppingTexts.totalExpenditure,
            value: "CAD 1350",
          ),
          SummaryRow(
            titleColor: AppColors.black,
            title: AgentShoppingTexts.alreadyPaid,
            value: "(-) CAD 1200",
            valueColor: AppColors.error,
          ),
          SummaryRow(
            titleColor: AppColors.black,
            title: AgentShoppingTexts.existingDues,
            value: "CAD 150",
          ),
          12.kH,
          const MessageContainer(message: "Approximate Time: 15 days (SHIPMENT+DROP-OFF), You can Track your parcel by using your Ticket Number", backgroundColor: AppColors.primary30,)
        ],
      ),
    );
  }
}
