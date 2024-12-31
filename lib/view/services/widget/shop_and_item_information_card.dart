import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/components/two_options_radio_row.dart';
import 'package:sheba_plus/view/services/third_party/controller/third_party_service_controller.dart';
import 'package:sheba_plus/view/services/widget/shop_item_information_card.dart';

class ShopAndItemInformationCard extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController contactNumberController;
  final TextEditingController howMuchNeedToPay;
  final bool alreadyPaid;
  final bool pickUpService;
  final TextEditingController unPaidTextEditingController;
  final List<ShopItem> items;
  final int shopIndex;
  final bool friendsAndFamily;
  final GlobalKey<FormState> formKey;

  ShopAndItemInformationCard({
    super.key,
    required this.nameController,
    required this.addressController,
    required this.contactNumberController,
    required this.unPaidTextEditingController,
    required this.items,
    required this.shopIndex,
    required this.formKey,
    required this.howMuchNeedToPay,
    required this.alreadyPaid,
    required this.pickUpService,
    this.friendsAndFamily = false,
  });

  final thirdPartyServiceController = Get.find<ThirdPartyServiceController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 4, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${friendsAndFamily ? "Relative/Friend" : "Shop"} and Item Information',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              TextButton(
                onPressed: () {
                  thirdPartyServiceController.deleteShop(shopIndex: shopIndex);
                },
                child: Row(
                  children: [
                    Icon(
                      PhosphorIcons.trash(),
                      color: AppColors.error,
                    ),
                    3.kW,
                    Text(
                      'Delete ${friendsAndFamily ? "" : "Shop"}',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.error),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        friendsAndFamily ? "Relative or Friend Information" : 'Shop Information',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      10.kH,
                      CustomTextField(
                        controller: nameController,
                        hintText: "Enter ${friendsAndFamily ? "relative" : "shop"} name",
                        validator: (value) => InputValidators.generalValidator(value: value, message: "Shop name is required"),
                      ),
                      10.kH,
                      CustomTextField(
                        controller: addressController,
                        hintText: 'Enter ${friendsAndFamily ? "relative" : "shop"} address',
                        validator: (value) => InputValidators.generalValidator(value: value, message: "Shop address is required"),
                      ),
                      10.kH,
                      CustomTextField(
                        controller: contactNumberController,
                        hintText: 'Enter ${friendsAndFamily ? "relative" : "contact person"} number',
                        validator: (value) => InputValidators.generalValidator(value: value, message: "Contact number is required"),
                      ),
                      20.kH,
                      Text(
                        'Item Information',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      10.kH,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...items.mapIndexed(
                            (index, itemController) => ShopItemInformationCard(
                              shopIndex: shopIndex,
                              itemIndex: index,
                              itemNameController: itemController.itemNameController,
                              quantity: itemController.quantity.value,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          thirdPartyServiceController.addNewItem(shopIndex: shopIndex);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            PhosphorIcons.plus(),
                            color: AppColors.primary,
                            size: 15,
                          ),
                          4.kW,
                          Text(
                            'Add New Item',
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: AppColors.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              5.kH,
              Padding(
                padding: AppPaddings.allPadding16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!friendsAndFamily)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Have You Already Paid?', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                          10.kH,
                          TwoOptionsRadioRow(
                            selectedValue: alreadyPaid,
                            onChanged: (value) => thirdPartyServiceController.togglePaidOrNot(shopIndex: shopIndex),
                          ),
                          10.kH,
                          alreadyPaid
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width * .4,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Already Paid',
                                        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.white),
                                      ),
                                      10.kW,
                                      const Icon(
                                        Icons.check_circle,
                                        color: AppColors.white,
                                      )
                                    ],
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'How much we need to pay*',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                    8.kH,
                                    CustomTextField(
                                      controller: howMuchNeedToPay,
                                      textInputType: TextInputType.number,
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          '(BDT)',
                                          style: Theme.of(context).textTheme.labelMedium,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                          16.kH,
                        ],
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Do you want pick-up service?',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        8.kH,
                        Text(
                          thirdPartyServiceController.pickUpServiceText,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        10.kH,
                        TwoOptionsRadioRow(
                          selectedValue: pickUpService,
                          onChanged: (value) => thirdPartyServiceController.needPickUpServiceYesOrNot(shopIndex: shopIndex),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
