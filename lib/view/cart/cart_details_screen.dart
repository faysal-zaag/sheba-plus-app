import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';
import 'package:sheba_plus/view/cart/controller/cart_controller.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/display_center/controller/display_service_controller.dart';

import 'widgets/cart_item_card.dart';
import 'widgets/order_summary_items.dart';

class CartDetailsScreen extends StatelessWidget {
  CartDetailsScreen({Key? key}) : super(key: key);

  final globalController = Get.find<GlobalController>();
  final cartController = Get.find<CartController>();
  final displayServiceController = Get.find<DisplayCenterServiceController>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      body: Obx(
        () => Column(
          children: [
            CustomHeaderContainer(
              title: 'My Cart',
              onBack: () {
                displayServiceController.searchFocusNode.value.unfocus();
              },
            ),
            2.kH,
            Expanded(
              child: cartController.cart.value.cartDetailsList.isEmpty
                  ? Center(
                      child: Text(
                        'No cart items',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    )
                  : ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          color: AppColors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              cartController.cart.value.cartDetailsList.length,
                              (counter) => CartItemCard(
                                cartDetails: cartController
                                    .cart.value.cartDetailsList[counter],
                                index: counter,
                              ),
                            ),
                          ),
                        ),
                        if (cartController
                            .cart.value.cartDetailsList.isNotEmpty) ...[
                          20.kH,
                          Container(
                            padding: const EdgeInsets.all(14.0),
                            color: AppColors.white,
                            child: OrderSummaryItems(
                              cartDetailsList:
                                  cartController.cart.value.cartDetailsList,
                            ),
                          )
                        ]
                      ],
                    ),
            ),
            if (cartController.cart.value.cartDetailsList.isNotEmpty)
              Container(
                color: AppColors.border,
                padding: const EdgeInsets.all(10.0),
                child: CustomPrimaryButton(
                  label: 'Proceed to Checkout',
                  onClick: () {
                    globalController.showRedeemPointModalSheet(
                        context: context,
                        totalDue: 150.00,
                        totalRedeemPoints: 80000);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
