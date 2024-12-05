import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/data/mock_data.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';

import 'widgets/cart_item_card.dart';
import 'widgets/order_summary_items.dart';

class CartDetailsScreen extends StatelessWidget {
  CartDetailsScreen({Key? key}) : super(key: key);

  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      body: Column(
        children: [
          const CustomHeaderContainer(title: 'My Cart'),
          2.kH,
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      3,
                      (counter) => CartItemCard(
                        productList: mockProductList,
                        index: counter,
                      ),
                    ),
                  ),
                ),
                20.kH,
                Container(
                  padding: const EdgeInsets.all(14.0),
                  color: AppColors.white,
                  child: OrderSummaryItems(
                    productList: mockProductList,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: AppColors.border,
            padding: const EdgeInsets.all(10.0),
            child: CustomPrimaryButton(
              label: 'Proceed to Checkout',
              onClick: () {
                globalController.showRedeemPointModalSheet(context: context, totalDue: 150.00, totalRedeemPoints: 80000);
              },
            ),
          )
        ],
      ),
    );
  }
}
