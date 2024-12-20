import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/components/project_branding.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/profile/saved-address/controller/address_controller.dart';

import '../display_center/widgets/display_center_app_bar_cart_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool userIcon;
  final bool hasCart;
  final bool displayCenter;

  CustomAppBar({super.key, this.userIcon = false, this.hasCart = false, this.displayCenter = false});

  final authController = Get.find<AuthController>();
  final addressController = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const ProjectBranding(),
      leading: IconButton(
        icon: Icon(PhosphorIcons.list()),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: userIcon
          ? [
              Obx(
                () => authController.isLoggedIn.isFalse
                    ? IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.signIn);
                        },
                        icon: Icon(
                          PhosphorIcons.user(),
                        ),
                      )
                    : Obx(() {
                        bool hasSavedAddress =
                            addressController.hasSavedAddress.value;

                        return PopupMenuButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                          icon: Icon(PhosphorIcons.user()),
                          onSelected: (String value) async {
                            if (value == ProfileScreenTexts.myProfile) {
                              if (!hasSavedAddress) {
                                Get.toNamed(Routes.registerAddress);
                              } else {
                                Get.toNamed(Routes.profile);
                              }
                            } else if (value == ProfileScreenTexts.logOut) {
                              authController.logout();
                              Utils.showSuccessToast(
                                  message: AuthScreenText.loggedOut);
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry<String>>[
                              PopupMenuItem(
                                value: ProfileScreenTexts.myProfile,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        PhosphorIcons.userCircle(),
                                        color: AppColors.subtext,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        ProfileScreenTexts.myProfile,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: ProfileScreenTexts.logOut,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        PhosphorIcons.signOut(),
                                        color: AppColors.error,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        ProfileScreenTexts.logOut,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(color: AppColors.error),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ];
                          },
                        );
                      }),
              )
            ]
          : displayCenter && authController.isLoggedIn.isFalse
              ? [const DisplayCenterAppBarCartWidget()]
          : hasCart && authController.isLoggedIn.isFalse
              ? [
        const DisplayCenterAppBarCartWidget()
                ]
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
