import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/third_party/controller/third_party_service_controller.dart';
import 'package:sheba_plus/view/third_party/widget/shop_item_information_card.dart';

import '../../../utils/constant/app_colors.dart';
import '../../components/custom_text_field.dart';
import '../../components/two_options_radio_row.dart';

class ShopAndItemInformationCard extends StatelessWidget {
  final TextEditingController shopNameController;
  final TextEditingController shopAddressController;
  final TextEditingController contactNumberController;
  final TextEditingController unPaidTextEditingController;

  ShopAndItemInformationCard(
      {super.key,
      required this.shopNameController,
      required this.shopAddressController,
      required this.contactNumberController,
      required this.unPaidTextEditingController});

  final thirdPartyServiceController = Get.find<ThirdPartyServiceController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shop and Item Information',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      PhosphorIcons.trash(),
                      color: AppColors.error,
                    ),
                    3.kW,
                    Text(
                      'Delete Shop',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: AppColors.error),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          // width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop Information',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              10.kH,
              CustomTextField(
                controller: shopNameController,
                hintText: 'Enter shop name',
              ),
              10.kH,
              CustomTextField(
                  controller: shopAddressController,
                  hintText: 'Enter shop address'),
              10.kH,
              CustomTextField(
                  controller: contactNumberController,
                  hintText: 'Enter contact person number'),
              20.kH,
              Text(
                'Item Information',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              10.kH,
              ShopItemInformationCard(
                itemNameController: shopNameController,
                quantity: 1,
              ),
              10.kH,
              TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        PhosphorIcons.plus(),
                        color: AppColors.primary,
                      ),
                      4.kW,
                      Text(
                        'Add New Item',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                      ),
                    ],
                  )),
              5.kH,
              Text(
                'Have You Already Paid?',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              10.kH,
              Obx(
                () => TwoOptionsRadioRow(
                  selectedValue: thirdPartyServiceController.alreadyPaid.value,
                  onChanged: thirdPartyServiceController.togglePaidOrNot,
                ),
              ),
              10.kH,
              Obx(
                () => thirdPartyServiceController.alreadyPaid.isTrue
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
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.white),
                            ),
                            5.kW,
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
                            controller: unPaidTextEditingController,
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
              ),
              15.kH,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do you want pick-up service?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  8.kH,
                  Text(
                    thirdPartyServiceController.pickUpServiceText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  10.kH,
                  Obx(
                    () => TwoOptionsRadioRow(
                      selectedValue:
                          thirdPartyServiceController.needPickUpService.value,
                      onChanged:
                          thirdPartyServiceController.needPickUpServiceYesOrNot,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        10.kH,
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                PhosphorIcons.plusCircle(),
                color: AppColors.primary,
              ),
              5.kW,
              Text(
                'Add New Shop',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
