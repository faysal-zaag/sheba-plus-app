import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/display_center/widgets/display_center_product/product_quantity_increment_decrement_widget.dart';

import '../../../utils/constant/app_colors.dart';

class ShopItemInformationCard extends StatelessWidget {
  final TextEditingController itemNameController;
  final int quantity;

  const ShopItemInformationCard(
      {super.key, required this.itemNameController, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: CustomTextField(controller: itemNameController,hintText: 'Enter item name',),),
        16.kW,
        CustomQuantityIncDecWidget(
          onIncrementPress: () {},
          onDecrementPress: () {},
          quantity: quantity,
          hasTitle: false,
          height: 46,
        ),
        16.kW,
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.circularRadius4,
            border: Border.all(color: AppColors.border),
          ),
          child: Icon(PhosphorIcons.trash(),color: AppColors.error,),
        ),
      ],
    );
  }
}
