import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

class DrawerFooterMenuItems extends StatelessWidget {
  final String header;
  final List<DrawerFooterMenu> menuItems;

  const DrawerFooterMenuItems(
      {super.key, required this.header, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: Theme.of(context).textTheme.displayMedium?.copyWith(color: AppColors.white),),
        12.kH,
        Column(
          children: [
            ...menuItems.map((menuItem) => GestureDetector(
                  onTap: () {
                    Get.offAndToNamed(menuItem.route);
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            menuItem.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.neutral70),
                          ),
                          6.kW,
                          Icon(PhosphorIcons.arrowUpRight(), color: AppColors.neutral70,),
                        ],
                      ),
                      12.kH,
                    ],
                  ),
                ))
          ],
        )
      ],
    );
  }
}
class DrawerFooterFlagSections extends StatelessWidget {
  final String header;
  final List<DrawerFooterCountry> countries;

  const DrawerFooterFlagSections(
      {super.key, required this.header, required this.countries});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: Theme.of(context).textTheme.displayMedium?.copyWith(color: AppColors.white),),
        12.kH,
        Column(
          children: [
            ...countries.map((menuItem) => Column(
              children: [
                Row(
                  children: [
                    Image.asset(menuItem.flag, height: 16, width: 24,),
                    6.kW,
                    Text(
                      menuItem.country,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.neutral70),
                    ),
                  ],
                ),
                12.kH,
              ],
            ))
          ],
        )
      ],
    );
  }
}

class DrawerFooterMenu {
  final String title;
  final String route;

  DrawerFooterMenu({required this.title, required this.route});
}

class DrawerFooterCountry {
  final String country;
  final String flag;

  DrawerFooterCountry({required this.country, required this.flag});
}
