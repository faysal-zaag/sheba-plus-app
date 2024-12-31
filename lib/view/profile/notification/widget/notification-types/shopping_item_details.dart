import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/invoice/invoice.dart';
import 'package:sheba_plus/models/shopping-details/shopping_details.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/shopping_details_container.dart';
import 'package:collection/collection.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/sopping_summary.dart';
import 'package:sheba_plus/view/services/services_texts.dart';

class ShoppingItemDetails extends StatelessWidget {
  final String message;
  final int orderId;
  final List<ShoppingDetails> shoppingDetailsList;
  final Invoice invoice;
  final num currentCadRate;
  final num hourBooked;

  const ShoppingItemDetails({
    super.key,
    required this.shoppingDetailsList,
    required this.invoice,
    required this.message,
    required this.currentCadRate,
    required this.hourBooked,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.allPadding16,
          child: MessageContainer(
            message: message,
            backgroundColor: AppColors.background2,
            borderColor: Colors.transparent,
          ),
        ),
        Container(
          width: double.infinity,
          padding: AppPaddings.allPadding16,
          color: AppColors.background2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ServicesTexts.shoppingWithAgent),
              16.kH,
              ...shoppingDetailsList.mapIndexed(
                (index, shoppingDetails) => Column(
                  children: [
                    ShoppingDetailsContainer(
                      currentCadRate: currentCadRate,
                      shoppingDetails: shoppingDetails,
                    ),
                    if (index < shoppingDetailsList.length - 1) const Divider()
                  ],
                ),
              ),
              24.kH,
              ShoppingSummary(
                hourBooked: hourBooked,
                invoice: invoice,
                currentCadRate: currentCadRate,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
