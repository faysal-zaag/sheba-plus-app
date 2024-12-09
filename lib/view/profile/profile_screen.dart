import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_dropdown.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/profile/account-management/account_management_screen.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';
import 'package:sheba_plus/view/profile/notification/notification_screen.dart';
import 'package:sheba_plus/view/profile/order-history/order_history_screen.dart';
import 'package:sheba_plus/view/profile/reward-points/reward_points_screen.dart';
import 'package:sheba_plus/view/profile/saved-address/saved_address_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const AccountManagementScreen(),
      SavedAddressScreen(),
      const OrderHistoryScreen(),
      const RewardPointsScreen(),
      const NotificationScreen(),
    ];

    return PrimaryScaffold(
      body: Padding(
        padding: AppPaddings.screenPadding,
        child: Column(
          children: [
            Obx(
              () => CustomDropdown(
                height: 56,
                items: AppConstants.profileMenuList
                    .map((menu) => menu.tr)
                    .toList(),
                onChanged: (value) {
                  profileController.selectedProfileMenu(value);
                },
                selectedValue: profileController.selectedProfileMenu.value,
                prefixIcon: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                icons: AppConstants.profileMenuIcons,
              ),
            ),
            16.kH,
            Obx(
              () => Expanded(
                child: screens[profileController
                        .selectedProfileMenuIndex.value],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
