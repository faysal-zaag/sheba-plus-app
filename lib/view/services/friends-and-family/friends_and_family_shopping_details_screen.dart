import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/services/services_texts.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/services/widget/shop_and_item_information_card.dart';
import 'package:sheba_plus/view/services/friends-and-family/controller/friends_and_family_shopping_controller.dart';

class FriendsAndFamilyShoppingDetails extends StatelessWidget {
  FriendsAndFamilyShoppingDetails({super.key});

  final friendsAndFamilyShoppingController = Get.find<FriendsAndFamilyShoppingController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      hasCart: true,
      body: Column(
        children: [
          CustomHeaderContainer(
            title: friendsAndFamilyShoppingController.headerText,
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: MessageContainer(message: friendsAndFamilyShoppingController.friendsFamilyServiceMessage),
                ),
                Obx(
                  () => Column(
                    children: [
                      ...friendsAndFamilyShoppingController.friendsAndFamilyShops.mapIndexed(
                        (index, shop) => ShopAndItemInformationCard(
                          friendsAndFamily: true,
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
                      friendsAndFamilyShoppingController.addNewShop();
                    }
                    else{
                      Utils.showErrorToast(message: ServicesTexts.firstShopNotFilledErrorMessage, alignment: Alignment.topCenter);
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
                        ServicesTexts.addNewRelative,
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
