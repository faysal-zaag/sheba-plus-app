import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/models/invoice/invoice.dart';
import 'package:sheba_plus/models/setting/config.dart';
import 'package:sheba_plus/services/product_services.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';
import 'package:sheba_plus/view/components/dashed_divider.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/services/services_texts.dart';
import 'package:sheba_plus/view/services/partial_checkout_texts.dart';
import 'package:sheba_plus/view/services/widget/summary_column.dart';
import 'package:sheba_plus/view/services/widget/summary_row.dart';

class ShoppingSummary extends StatelessWidget {
  final Invoice invoice;
  final num currentCadRate;
  final num hourBooked;

  ShoppingSummary({super.key, required this.invoice, required this.currentCadRate, required this.hourBooked});

  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    final lightTextStyle = Theme.of(context).textTheme.titleSmall;
    final subTextStyle = lightTextStyle?.copyWith(color: AppColors.hintText);

    return Container(
      color: AppColors.background2,
      child: Column(
        children: [
          SummaryRow(
            titleColor: AppColors.black,
            title: ServicesTexts.totalShoppingCost,
            customValue: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ServicesTexts.totalItemPrice,
                  style: subTextStyle,
                ),
                4.kH,
                Text("BDT ${ProductServices.getAmount(price: invoice.shoppingCost * currentCadRate)}"),
                4.kH,
                Row(
                  children: [
                    Text(
                      "(1CAD=$currentCadRate BDT)",
                      style: subTextStyle,
                    ),
                    Text(
                      " CAD ${ProductServices.getAmount(price: invoice.shoppingCost)}",
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
            title: PartialCheckoutTexts.agentFee,
            customValue: Row(
              children: [
                SummaryColumn(title: ServicesTexts.totalHour, value: "CAD ${ProductServices.getAmount(price: hourBooked)}"),
                24.kW,
                SummaryColumn(title: ServicesTexts.totalFee, value: "CAD ${ProductServices.getAmount(price: invoice.agentFee)}"),
              ],
            ),
          ),
          12.kH,
          SummaryRow(
            titleColor: AppColors.black,
            title: ServicesTexts.shippingCost,
            customValue: SummaryColumn(title: ServicesTexts.totalShippingCost, value: "CAD ${ProductServices.getAmount(price: invoice.shippingCost)}"),
          ),
          12.kH,
          SummaryRow(
            titleColor: AppColors.black,
            title: ServicesTexts.tax,
            customValue: SummaryColumn(title: ServicesTexts.totalTax, value: "CAD ${ProductServices.getAmount(price: invoice.totalTax)}"),
          ),
          12.kH,
          SummaryRow(
            titleColor: AppColors.black,
            title: ServicesTexts.vat,
            customValue: SummaryColumn(title: ServicesTexts.totalVat, value: "CAD ${invoice.totalVat}"),
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
            value: ServicesTexts.total,
            valueColor: AppColors.hintText,
          ),
          SummaryRow(
            titleColor: AppColors.black,
            title: PartialCheckoutTexts.dropOffService,
            value: "CAD ${ProductServices.getAmount(price: invoice.dropOffCost)}",
          ),
          const DashedDivider(),
          12.kH,
          SummaryRow(
            titleColor: AppColors.black,
            title: ServicesTexts.totalExpenditure,
            value: "CAD ${ProductServices.getAmount(price: invoice.finalPrice)}",
          ),
          SummaryRow(
            titleColor: AppColors.black,
            title: ServicesTexts.alreadyPaid,
            value: "(-) CAD ${ProductServices.getAmount(price: invoice.paidAmount)}",
            valueColor: AppColors.error,
          ),
          SummaryRow(
            titleColor: AppColors.black,
            title: ServicesTexts.existingDues,
            value: "CAD ${ProductServices.getAmount(price: invoice.finalPrice - invoice.paidAmount)}",
          ),
          12.kH,
          const MessageContainer(
            message: "Approximate Time: 15 days (SHIPMENT+DROP-OFF), You can Track your parcel by using your Ticket Number",
            backgroundColor: AppColors.primary30,
          )
        ],
      ),
    );
  }
}
