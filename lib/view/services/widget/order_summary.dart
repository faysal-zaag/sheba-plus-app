import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/services/agent-shopping/controller/agent_shopping_controller.dart';
import 'package:sheba_plus/view/services/partial_checkout_texts.dart';
import 'package:sheba_plus/view/services/widget/summary_row.dart';

class OrderSummary extends StatelessWidget {
  OrderSummary({super.key});

  final agentShoppingController = Get.find<AgentShoppingController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: AppPaddings.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PartialCheckoutTexts.orderSummary,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          36.kH,
          SummaryRow(
            customTitle: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.displayMedium,
                children: [
                  TextSpan(text: PartialCheckoutTexts.agentFee),
                  const TextSpan(text: " "),
                  TextSpan(
                      text: "(${agentShoppingController.agentShoppingServiceDurationController.value.text} Hours)", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: AppColors.blue))
                ],
              ),
            ),
            value: "CAD",
          ),
          SummaryRow(
            title: PartialCheckoutTexts.shoppingCost,
            value: GlobalTexts.pending,
            valueColor: AppColors.error,
          ),
          SummaryRow(
            title: PartialCheckoutTexts.shippingCost,
            value: GlobalTexts.pending,
            valueColor: AppColors.error,
          ),
          SummaryRow(
            title: PartialCheckoutTexts.dropOffCost,
            value: GlobalTexts.pending,
            valueColor: AppColors.error,
          ),
          const Divider(
            color: AppColors.divider,
          ),
          SummaryRow(
            title: PartialCheckoutTexts.orderTotal,
            value: "CAD 120.00",
            valueColor: AppColors.error,
            titleStyle: Theme.of(context).textTheme.labelLarge,
            valueStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
