import 'package:flutter/material.dart';
import 'package:sheba_plus/data/mock_data.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_app_bar_container_widget.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';

import 'widgets/cart_item_card.dart';
import 'widgets/order_summary_items.dart';

class CartDetailsScreen extends StatelessWidget {
  const CartDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      body: Column(
        children: [
          const CustomAppBarContainerWidget(title: 'My Cart'),
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
              onClick: () {},
            ),
          )
        ],
      ),
    );
  }
}
