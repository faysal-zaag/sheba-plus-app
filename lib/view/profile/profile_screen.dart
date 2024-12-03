import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_dropdown.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
        body: Padding(
      padding: AppPaddings.screenPadding,
      child: Column(
        children: [
          Obx(
            () => CustomDropdown(
              height: 56,
              items: AppConstants.profileMenuList,
              onChanged: (value) =>
                  profileController.selectedProfileMenu(value),
              selectedValue: profileController.selectedProfileMenu.value,
              prefixIcon: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              icons: AppConstants.profileMenuIcons,
            ),
          ),
          16.kH,
          Expanded(
            child: Obx(() => profileController.getSelectedScreen()),
          ),
        ],
      ),
    ));
  }
}
