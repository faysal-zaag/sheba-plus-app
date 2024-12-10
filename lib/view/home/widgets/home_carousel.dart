import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';
import 'package:sheba_plus/view/home/home_screen_texts.dart';

class HomeCarousel extends StatelessWidget {
  final HomeController homeController;

  const HomeCarousel({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    List<String> carouselHeaderTexts = [
      HomeScreenText.agentShopping,
      HomeScreenText.displayCenter,
      HomeScreenText.thirdParty,
      HomeScreenText.friendsFamily,
    ];

    List<String> carouselHeaderDetails = [
      HomeScreenText.agentShoppingDetails1,
      HomeScreenText.displayCenterDetails1,
      HomeScreenText.thirdPartyDetails1,
      HomeScreenText.friendsFamilyDetails1,
    ];

    return Stack(
      children: [
        SizedBox(
          height: 220,
          child: CarouselSlider.builder(
            carouselController: homeController.carouselSliderController,
            itemCount: 4,
            options: CarouselOptions(
              height: 220,
              aspectRatio: 16 / 9,
              enlargeCenterPage: false,
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                homeController.onCarouselChange(index); // Update the current index here
              },
            ),
            itemBuilder: (ctx, index, realIdx) {
              return Stack(
                children: [
                  // Image
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    child: Image.asset(
                      AppConstants.carouselImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Gradient Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.black.withOpacity(0.5)),
                    ),
                  ),
                  // Banner text
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(carouselHeaderTexts[index].tr, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.white)),
                            12.kH,
                            Text(
                              carouselHeaderDetails[index].tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        // navigation's
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: AppConstants.carouselImages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => homeController.carouselSliderController.animateToPage(entry.key),
                  child: Obx(
                    () => Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(homeController.carouselCurrentIndex.value == entry.key ? 0.9 : 0.5),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        // left arrow
        Positioned.fill(
            child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              homeController.carouselSliderController.previousPage();
            },
            icon: Icon(
              PhosphorIcons.caretLeft(),
              color: Colors.white,
              size: 25,
            ),
          ),
        )),
        // right arrow
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                homeController.carouselSliderController.nextPage();
              },
              icon: Icon(
                PhosphorIcons.caretRight(),
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
