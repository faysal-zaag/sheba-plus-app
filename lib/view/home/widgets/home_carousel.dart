import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';

class HomeCarousel extends StatelessWidget {
  final HomeController homeController;
  const HomeCarousel({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 120,
          child: CarouselSlider.builder(
            carouselController: homeController.carouselSliderController,
            itemCount: 3,
            options: CarouselOptions(
              height: 120,
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
                    height: 120,
                    child: Image.asset(
                      "assets/carousel/carousel-${index + 1}.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Gradient Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent, // Top transparent
                            Colors.black.withOpacity(0.6), // Bottom light black
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
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: AppConstants.imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => homeController.carouselSliderController
                      .animateToPage(entry.key),
                  child: Obx(
                        () => Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                            .withOpacity(homeController.carouselCurrentIndex.value == entry.key ? 0.9 : 0.5),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
