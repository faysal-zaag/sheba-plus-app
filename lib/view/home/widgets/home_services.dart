import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';
import 'package:sheba_plus/view/home/home_screen_texts.dart';
import 'package:sheba_plus/view/home/widgets/home_service_card.dart';

class HomeServices extends StatelessWidget {
  final ScrollController scrollController;

  HomeServices({super.key, required this.scrollController});

  final homeController = Get.find<HomeController>();

  final List<GlobalKey> cardKeys = List.generate(4, (_) => GlobalKey());

  void scrollToCard(int index) {
    final cardContext = cardKeys[index].currentContext;

    if (cardContext != null) {
      // Get the position of the card
      final box = cardContext.findRenderObject() as RenderBox;
      final offset = box.localToGlobal(Offset.zero, ancestor: null).dy - 50;

      // Scroll to the card position
      scrollController.animateTo(
        scrollController.offset + offset - kToolbarHeight,
        duration: const Duration(milliseconds: 600), // Increase duration for smoother scroll
        curve: Curves.easeInOutCubic, // Use a smoother curve
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeServiceCard(
          key: cardKeys[0],
          index: 1,
          contents: [
            Obx(
              () => Text(
                HomeScreenText.agentShopping,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: homeController.selectedService.value == 1 ? AppColors.primary : AppColors.black,
                    ),
              ),
            ),
            4.kH,
            Text(
              HomeScreenText.agentShoppingDetails1,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtext),
            )
          ],
          setOnFocus: () {
            scrollToCard(0);
          },
        ),
        HomeServiceCard(
          key: cardKeys[1],
          index: 2,
          contents: [
            Obx(
              () => Text(
                HomeScreenText.displayCenter,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: homeController.selectedService.value == 2 ? AppColors.primary : AppColors.black),
              ),
            ),
            4.kH,
            Text(
              HomeScreenText.displayCenterDetails1,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtext),
            )
          ],
          setOnFocus: () {
            scrollToCard(1);
          },
        ),
        HomeServiceCard(
          key: cardKeys[2],
          index: 3,
          contents: [
            Obx(
              () => Text(
                HomeScreenText.thirdParty,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: homeController.selectedService.value == 3 ? AppColors.primary : AppColors.black),
              ),
            ),
            4.kH,
            Text(
              HomeScreenText.thirdPartyDetails1,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtext),
            ),
            Obx(
              () => homeController.selectedService.value == 3
                  ? Column(
                      children: [
                        12.kH,
                        Text(
                          HomeScreenText.thirdPartyDetails2,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtext),
                        ),
                        12.kH,
                        Text(
                          HomeScreenText.thirdPartyDetails3,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtext),
                        ),
                        12.kH,
                        Text(
                          HomeScreenText.thirdPartyDetails4,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtext),
                        ),
                      ],
                    )
                  : const SizedBox(),
            )
          ],
          setOnFocus: () {
            scrollToCard(2);
          },
        ),
        HomeServiceCard(
          key: cardKeys[3],
          index: 4,
          contents: [
            Obx(
              () => Text(
                HomeScreenText.friendsFamily,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: homeController.selectedService.value == 4 ? AppColors.primary : AppColors.black),
              ),
            ),
            4.kH,
            Text(
              HomeScreenText.friendsFamilyDetails1,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtext),
            ),
            Obx(
              () => homeController.selectedService.value == 4
                  ? Column(
                      children: [
                        12.kH,
                        Text(
                          HomeScreenText.friendsFamilyDetails2,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtext),
                        ),
                      ],
                    )
                  : const SizedBox(),
            )
          ],
          setOnFocus: () {
            scrollToCard(3);
          },
        ),
      ],
    );
  }
}
