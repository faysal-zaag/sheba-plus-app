import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/services/third_party/controller/third_party_service_controller.dart';
import 'package:sheba_plus/view/services/widget/shop_and_item_information_card.dart';
import 'package:collection/collection.dart';

class ThirdPartyShopAndItemDetailsScreen extends StatelessWidget {
  ThirdPartyShopAndItemDetailsScreen({super.key});

  final thirdPartyServiceController = Get.find<ThirdPartyServiceController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      hasCart: true,
      body: Column(
        children: [
          const CustomHeaderContainer(
            title: '3rd Party Shop & Item details',
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: MessageContainer(message: thirdPartyServiceController.thirdPartyServiceMessage),
                ),
                Obx(
                  () => Column(
                    children: [
                      ...thirdPartyServiceController.thirdPartyShops.mapIndexed(
                        (index, shop) => ShopAndItemInformationCard(
                          formKey: formKey,
                          shopIndex: index,
                          nameController: shop.nameController,
                          addressController: shop.addressController,
                          contactNumberController: shop.contactNumberController,
                          unPaidTextEditingController: shop.unPaidTextController,
                          alreadyPaid: shop.alreadyPaid.value,
                          howMuchNeedToPay: shop.howMuchNeedToPayController,
                          pickUpService: shop.pickUpService.value,
                          items: shop.items,
                        ),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      thirdPartyServiceController.addNewShop();
                    }
                    else{
                      Utils.showErrorToast(message: "Complete the first shop information", alignment: Alignment.topCenter);
                    }
                  },
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
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: AppColors.cardBg,
            border: Border(
              top: BorderSide(color: AppColors.neutral65),
            ),
          ),
          padding: AppPaddings.allPadding16,
          child: CustomPrimaryButton(
            label: GlobalTexts.next,
            onClick: () {},
          )),
    );
  }
}
