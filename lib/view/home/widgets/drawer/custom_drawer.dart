import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/extensions.dart';
import 'package:sheba_plus/view/components/custom_close_button.dart';
import 'package:sheba_plus/view/components/custom_dropdown.dart';
import 'package:sheba_plus/view/components/project_branding.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';
import 'package:sheba_plus/view/home/home_screen_texts.dart';
import 'package:sheba_plus/view/home/widgets/drawer/drawer_footer_menu_items.dart';
import 'package:sheba_plus/view/home/widgets/drawer/drawer_menu_item.dart';
import 'package:sheba_plus/view/home/widgets/drawer/drawer_social_icons.dart';
import 'package:sheba_plus/view/home/widgets/drawer/footer_text.dart';
import 'package:sheba_plus/view/home/widgets/drawer/payment_methods.dart';
import 'package:collection/collection.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final storageService = Get.find<StorageService>();
  final homeController = Get.find<HomeController>();
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomCloseButton(
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              10.kH,
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ...AppConstants.drawerMenuItems.mapIndexed((index, menuItem) => Column(
                          children: [
                            DrawerMenuItem(
                              title: AppConstants.drawerMenuItems[index].tr,
                              suffix: index == 4
                                  ? Obx(
                                      () => CustomDropdown(
                                        items: AppConstants.languages,
                                        height: 24,
                                        icon: Icons.arrow_drop_down,
                                        onChanged: (value) {
                                          if (value == "English") {
                                            Get.updateLocale(const Locale('en', 'US'));
                                            storageService.saveLanguage("en");
                                            profileController.selectedProfileMenu(AppConstants.profileMenuListBangla[profileController.selectedProfileMenu.value]?.tr);
                                          } else {
                                            Get.updateLocale(const Locale('bn', 'BD'));
                                            storageService.saveLanguage("bn");
                                            profileController.selectedProfileMenu(profileController.selectedProfileMenu.value.camelCase?.tr);
                                          }
                                          homeController.selectedLanguage(value);
                                        },
                                        selectedValue: homeController.selectedLanguage.value,
                                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                            const Divider()
                          ],
                        ))
                  ],
                ),
              ),
              Container(
                color: AppColors.black,
                padding: AppPaddings.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProjectBranding(),
                    16.kH,
                    Text(
                      HomeScreenText.companyAddress,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.neutral70),
                    ),
                    16.kH,
                    const DrawerSocialIcons(),
                    24.kH,
                    DrawerFooterMenuItems(header: "company".tr, menuItems: [DrawerFooterMenu(title: "aboutUs".tr, route: "/"), DrawerFooterMenu(title: "ourBlog".tr, route: "/")]),
                    20.kH,
                    DrawerFooterMenuItems(header: "contact".tr, menuItems: [
                      DrawerFooterMenu(title: "chatWithUs".tr, route: "/"),
                      DrawerFooterMenu(title: "callUs".tr, route: "/"),
                      DrawerFooterMenu(title: "emailUs".tr, route: "/"),
                    ]),
                    20.kH,
                    DrawerFooterFlagSections(header: "ourOffice".tr, countries: [
                      DrawerFooterCountry(country: "canada".tr, flag: AppImages.usaFlag),
                      DrawerFooterCountry(country: "usa".tr, flag: AppImages.canadaFlag),
                      DrawerFooterCountry(country: "bangladesh".tr, flag: AppImages.bdFlag),
                    ]),
                    20.kH,
                    const PaymentMethods(),
                    24.kH,
                    const Divider(
                      color: AppColors.subtext,
                    ),
                    24.kH,
                    const FooterText()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
