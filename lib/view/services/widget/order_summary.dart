import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/data/api/config.dart';
import 'package:sheba_plus/services/product_services.dart';
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
  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    double shoppingAmount = double.parse(agentShoppingController.agentShoppingSpendAmountController.value.text);
    double currencyConversionRate = globalController.globalConfig.value.currencyConversionRate;
    String total = ProductServices.getAmount(
        price: (double.parse(agentShoppingController.agentShoppingServiceTotalCostController.value.text) + (shoppingAmount > 25000 ? shoppingAmount : 0) / currencyConversionRate));

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
            value: "${agentShoppingController.agentShoppingServiceTotalCostController.value.text} CAD",
          ),
          SummaryRow(
            title: PartialCheckoutTexts.shoppingCost,
            value: shoppingAmount > 25000 ? "${ProductServices.getAmount(price: shoppingAmount / currencyConversionRate)} ${GlobalTexts.bdt}" : GlobalTexts.pending,
            valueColor: shoppingAmount > 25000 ? AppColors.black : AppColors.error,
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
            value: "CAD $total",
            valueColor: AppColors.error,
            titleStyle: Theme.of(context).textTheme.labelLarge,
            valueStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
