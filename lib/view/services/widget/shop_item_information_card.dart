import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/display_center/widgets/display_center_product/product_quantity_increment_decrement_widget.dart';
import 'package:sheba_plus/view/services/third_party/controller/third_party_service_controller.dart';


class ShopItemInformationCard extends StatelessWidget {
  final TextEditingController itemNameController;
  final int quantity;
  final int shopIndex;
  final int itemIndex;

  ShopItemInformationCard(
      {super.key, required this.itemNameController, required this.quantity, required this.itemIndex, required this.shopIndex});

  final thirdPartyServiceController = Get.find<ThirdPartyServiceController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomTextField(
              controller: itemNameController,
              hintText: 'Enter item name',
              validator: (value) => InputValidators.generalValidator(value: value, message: "Item name is required"),
            ),
          ),
          12.kW,
          CustomQuantityIncDecWidget(
            onIncrementPress: () => thirdPartyServiceController.increaseQuantity(shopIndex, itemIndex),
            onDecrementPress: () => thirdPartyServiceController.decreaseQuantity(shopIndex, itemIndex),
            quantity: quantity,
            hasTitle: false,
            height: 48,
          ),
          12.kW,
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.circularRadius6,
              border: Border.all(color: AppColors.border),
            ),
            child: Icon(
              PhosphorIcons.trash(),
              color: AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
