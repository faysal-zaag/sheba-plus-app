import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';
import 'package:sheba_plus/view/home/home_screen_texts.dart';
import 'package:sheba_plus/view/home/widgets/home_carousel.dart';
import 'package:sheba_plus/view/home/widgets/home_services.dart';
import 'package:sheba_plus/view/home/widgets/newly_added_products.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      userIcon: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // carousel
            HomeCarousel(homeController: homeController),
            // home service header information
            Padding(
              padding: AppPaddings.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HomeText.header1,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  16.kH,
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: HomeText.headerDescription,
                        ),
                        TextSpan(
                          text: " ${HomeText.headerMoto}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                  16.kH,
                  Text(
                    "${HomeText.serviceSelection} :",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.subtext),
                  ),
                ],
              ),
            ),
            // home services
            HomeServices(),
            // mega sell image
            16.kH,
            Image.asset(AppImages.megaSell),
            const NewlyAddedProducts()
          ],
        ),
      ),
    );
  }
}
