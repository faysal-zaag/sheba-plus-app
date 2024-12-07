import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_close_button.dart';
import 'package:sheba_plus/view/components/custom_dropdown.dart';
import 'package:sheba_plus/view/components/project_branding.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';
import 'package:sheba_plus/view/home/home_texts.dart';
import 'package:sheba_plus/view/home/widgets/drawer/drawer_footer_menu_items.dart';
import 'package:sheba_plus/view/home/widgets/drawer/drawer_menu_item.dart';
import 'package:sheba_plus/view/home/widgets/drawer/drawer_social_icons.dart';
import 'package:sheba_plus/view/home/widgets/drawer/footer_text.dart';
import 'package:sheba_plus/view/home/widgets/drawer/payment_methods.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),
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
                height: 360,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppConstants.drawerMenuItems.length,
                  itemBuilder: (context, index) {
                    return DrawerMenuItem(
                      title: AppConstants.drawerMenuItems[index],
                      suffix: index == 4
                          ? Obx(
                              () => CustomDropdown(
                                items: AppConstants.languages,
                                height: 24,
                                icon: Icons.arrow_drop_down,
                                onChanged: (value) =>
                                    homeController.selectedLanguage(value),
                                selectedValue:
                                    homeController.selectedLanguage.value,
                                labelStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                            )
                          : const SizedBox(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                    );
                  },
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
                      HomeText.companyAddress,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: AppColors.neutral70),
                    ),
                    16.kH,
                    const DrawerSocialIcons(),
                    24.kH,
                    DrawerFooterMenuItems(header: "COMPANY", menuItems: [
                      DrawerFooterMenu(title: "ABOUT US", route: "/"),
                      DrawerFooterMenu(title: "OUR BLOG", route: "/")
                    ]),
                    20.kH,
                    DrawerFooterMenuItems(header: "CONTACT", menuItems: [
                      DrawerFooterMenu(title: "CHAT WITH US", route: "/"),
                      DrawerFooterMenu(title: "CALL US", route: "/"),
                      DrawerFooterMenu(title: "EMAIL US", route: "/"),
                    ]),
                    20.kH,
                    DrawerFooterFlagSections(header: "OUR OFFICE", countries: [
                      DrawerFooterCountry(country: "CANADA", flag: AppImages.usaFlag),
                      DrawerFooterCountry(country: "USA", flag: AppImages.canadaFlag),
                      DrawerFooterCountry(country: "BANGLADESH", flag: AppImages.bdFlag),
                    ]),
                    20.kH,
                    const PaymentMethods(),
                    24.kH,
                    const Divider(color: AppColors.subtext,),
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
