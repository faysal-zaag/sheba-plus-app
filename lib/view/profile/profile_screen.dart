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
                items: AppConstants.profileMenuList.map((menu) => menu.tr).toList(),
                onChanged: (value) {
                  if (value == "accountManagement".tr) {
                    profileController.selectedProfileMenuIndex(0);
                  } else if (value == "savedAddress".tr) {
                    profileController.selectedProfileMenuIndex(1);
                  } else if (value == "orderHistory".tr) {
                    profileController.selectedProfileMenuIndex(2);
                  } else if (value == "rewardPoints".tr) {
                    profileController.selectedProfileMenuIndex(3);
                  } else if (value == "notification".tr) {
                    profileController.selectedProfileMenuIndex(4);
                  }
                  profileController.selectedProfileMenu(value);
                },
                selectedValue: profileController.selectedProfileMenu.value,
                prefixIcon: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                icons: AppConstants.profileMenuIcons,
                labelStyle: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            16.kH,
            Obx(
              () => Expanded(
                child: profileController.getCurrentScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
