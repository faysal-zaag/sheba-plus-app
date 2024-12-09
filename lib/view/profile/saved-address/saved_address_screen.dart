import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/profile/saved-address/controller/address_controller.dart';
import 'package:sheba_plus/view/profile/saved-address/widget/address_card.dart';

class SavedAddressScreen extends StatelessWidget {
  SavedAddressScreen({super.key});

  final addressController = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        itemBuilder: (_, index) => AddressCard(
          address: addressController.addresses[index],
        ),
        separatorBuilder: (_, index) => 12.kH,
        itemCount: addressController.addresses.length,
      ),
    );
  }
}
