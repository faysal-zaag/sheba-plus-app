import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constant/app_constants.dart';

class DisplayCenterServiceProductCarousel extends StatelessWidget {
  final CarouselSliderController carouselSliderController;
  final Function onCarouselChange;
  final int totalCarouselItem;
  final int carouselCurrentIndex;

  const DisplayCenterServiceProductCarousel(
      {super.key,
      required this.carouselSliderController,
      required this.onCarouselChange,
      required this.totalCarouselItem,
      required this.carouselCurrentIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: carouselSliderController,
          itemCount: totalCarouselItem,
          options: CarouselOptions(
            height: 260,
            aspectRatio: 16 / 9,
            enlargeCenterPage: false,
            autoPlay: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              onCarouselChange(index); // Update the current index here
            },
          ),
          itemBuilder: (ctx, index, realIdx) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Image.asset(
                "assets/carousel/carousel-${index + 1}.jpg",
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: AppConstants.carouselImages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () =>
                      carouselSliderController.animateToPage(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: carouselCurrentIndex == entry.key ? 18 : 8.0,
                    height: 4.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      shape: BoxShape.rectangle,
                      color: Colors.black45.withOpacity(
                          carouselCurrentIndex == entry.key ? 0.9 : 0.5),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 110,
          child: IconButton(
            onPressed: () {
              carouselSliderController.previousPage();
            },
            icon: SvgPicture.asset('assets/icons/left_arrow.svg'),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 110,
          child: IconButton(
            onPressed: () {
              carouselSliderController.nextPage();
            },
            icon: SvgPicture.asset('assets/icons/right_arrow.svg'),
          ),
        ),
      ],
    );
  }
}
