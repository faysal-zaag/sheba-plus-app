import 'package:flutter/material.dart';
import 'package:sheba_plus/models/invoice/invoice.dart';
import 'package:sheba_plus/models/setting/config.dart';
import 'package:sheba_plus/models/shopping-details/shopping_details.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/shopping_details_container.dart';
import 'package:collection/collection.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/sopping_summary.dart';

class ShoppingItemDetails extends StatelessWidget {
  final String message;
  final List<ShoppingDetails> shoppingDetailsList;
  final Invoice invoice;
  final Config config;

  const ShoppingItemDetails({super.key, required this.shoppingDetailsList, required this.invoice, required this.config, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.allPadding16,
          child: MessageContainer(
            message: message,
            backgroundColor: AppColors.background2,
            borderColor: Colors.transparent,
          ),
        ),
        ...shoppingDetailsList.mapIndexed(
          (index, shoppingDetails) => Column(
            children: [
              ShoppingDetailsContainer(
                config: config,
                shoppingDetails: shoppingDetails,
              ),
              if (index < shoppingDetailsList.length - 1) const Divider()
            ],
          ),
        ),
        ShoppingSummary(
          invoice: invoice,
          config: config,
        )
      ],
    );
  }
}
