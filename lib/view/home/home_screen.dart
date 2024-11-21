import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';
import 'package:sheba_plus/view/home/home_texts.dart';
import 'package:sheba_plus/view/home/widgets/home_carousel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeCarousel(homeController: homeController),
          Padding(
            padding: AppPaddings.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(HomeText.header1, style: Theme.of(context).textTheme.headlineSmall,),
                16.kH,
                Text(HomeText.headerDescription, style: Theme.of(context).textTheme.bodySmall,),
                16.kH,
                Text("${HomeText.serviceSelection} :", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtext),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
