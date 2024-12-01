import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routers.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';
import 'package:sheba_plus/view/home/home_texts.dart';
import 'package:sheba_plus/view/home/widgets/home_service_card.dart';

class HomeServices extends StatelessWidget {
  HomeServices({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeServiceCard(
          index: 1,
          contents: [
            Obx(
              () => Text(
                HomeText.agentShopping,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: homeController.selectedService.value == 1
                        ? AppColors.primary
                        : AppColors.black),
              ),
            ),
            4.kH,
            Text(
              HomeText.agentShoppingDetails1,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.subtext),
            )
          ], onTapService: () {},
        ),
        const Divider(),
        HomeServiceCard(
          index: 2,
          contents: [
            Obx(
              () => Text(
                HomeText.displayCenter,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: homeController.selectedService.value == 2
                        ? AppColors.primary
                        : AppColors.black),
              ),
            ),
            4.kH,
            Text(
              HomeText.displayCenterDetails1,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.subtext),
            )
          ], onTapService: () {
            Get.toNamed(Routes.displayCenterServiceProductListScreen);
        },
        ),
        const Divider(),
        HomeServiceCard(
          index: 3,
          contents: [
            Obx(
              () => Text(
                HomeText.thirdParty,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: homeController.selectedService.value == 3
                        ? AppColors.primary
                        : AppColors.black),
              ),
            ),
            4.kH,
            Text(
              HomeText.thirdPartyDetails1,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.subtext),
            ),
            Obx(() => homeController.selectedService.value == 3
                ? Column(
                    children: [
                      12.kH,
                      Text(
                        HomeText.thirdPartyDetails2,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.subtext),
                      ),
                      12.kH,
                      Text(
                        HomeText.thirdPartyDetails3,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.subtext),
                      ),
                      12.kH,
                      Text(
                        HomeText.thirdPartyDetails4,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.subtext),
                      ),
                    ],
                  )
                : const SizedBox())
          ], onTapService: () {},
        ),
        const Divider(),
        HomeServiceCard(
          index: 4,
          contents: [
            Obx(
              () => Text(
                HomeText.friendsFamily,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: homeController.selectedService.value == 4
                        ? AppColors.primary
                        : AppColors.black),
              ),
            ),
            4.kH,
            Text(
              HomeText.friendsFamilyDetails1,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.subtext),
            ),
            Obx(() => homeController.selectedService.value == 4
                ? Column(
                    children: [
                      12.kH,
                      Text(
                        HomeText.friendsFamilyDetails2,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.subtext),
                      ),
                    ],
                  )
                : const SizedBox())
          ], onTapService: () {},
        ),
        const Divider(),
      ],
    );
  }
}
