import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';
import 'package:sheba_plus/view/home/home_texts.dart';

class HomeServiceCard extends StatelessWidget {
  final List<Widget> contents;
  final int index;

  HomeServiceCard({super.key, required this.contents, required this.index});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(homeController.selectedService.value == 0 || homeController.selectedService.value == index){
          homeController.onSelectService(index);
        }
      },
      child: Obx(
        () => Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: homeController.selectedService.value == index
                  ? AppColors.primaryLight.withOpacity(0.5)
                  : AppColors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        homeController.selectedService.value == index
                            ? Icon(
                                PhosphorIcons.checkCircle(
                                    PhosphorIconsStyle.fill),
                                color: AppColors.primary,
                              )
                            : Icon(PhosphorIcons.circle()),
                        8.kW,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...contents,
                              homeController.selectedService.value == index
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        12.kH,
                                        Text(
                                          HomeText.shipmentMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: AppColors.hintText),
                                        ),
                                        12.kH,
                                        Text(
                                          HomeText.dropOffMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: AppColors.hintText),
                                        ),
                                        24.kH,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomPrimaryButton(
                                              label: "Select Service",
                                              onClick: () {},
                                              width: 160,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => homeController.selectedService.value != index
                        ? Row(
                            children: [
                              10.kW,
                              Icon(PhosphorIcons.caretRight()),
                            ],
                          )
                        : const SizedBox(),
                  )
                ],
              ),
            ),
            if(homeController.selectedService.value != index && homeController.selectedService.value != 0)
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    height: 180.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        color: Colors.grey.shade200.withOpacity(0.5)),
                    child: Container(color: Colors.transparent,),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
