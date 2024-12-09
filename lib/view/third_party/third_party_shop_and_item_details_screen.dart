import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_appbar.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/third_party/controller/third_party_service_controller.dart';

import 'widget/shop_and_item_information_card.dart';

class ThirdPartyShopAndItemDetailsScreen extends StatelessWidget {
  ThirdPartyShopAndItemDetailsScreen({super.key});

  final thirdPartyServiceController = Get.find<ThirdPartyServiceController>();

  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopAddressController = TextEditingController();
  final TextEditingController shopPhoneNumberController =
      TextEditingController();
  final TextEditingController unPaidTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      hasCart: true,
      body: Stack(
        children: [
          Column(
            children: [
              const CustomHeaderContainer(
                title: '3rd Party Shop & Item details',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: MessageContainer(
                          message: thirdPartyServiceController
                              .thirdPartyServiceMessage),
                    ),
                    ShopAndItemInformationCard(
                      shopNameController: shopNameController,
                      shopAddressController: shopAddressController,
                      contactNumberController: shopPhoneNumberController,
                      unPaidTextEditingController: unPaidTextController,
                    ),
                    200.kH,
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
                color: AppColors.white,
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                child: CustomPrimaryButton(
                  label: GlobalTexts.next,
                  onClick: () {},
                )),
          ),
        ],
      ),
    );
  }
}
