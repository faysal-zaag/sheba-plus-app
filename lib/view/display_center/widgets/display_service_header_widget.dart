import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/display_service_controller.dart';

class DisplayServiceHeaderWidget extends StatelessWidget {
  DisplayServiceHeaderWidget({super.key});

  final displayCenterServiceController = Get.find<DisplayCenterServiceController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Image.asset(
          'assets/images/sale_banner.png',
          height: height * .2,
          fit: BoxFit.fill,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text(
              '${displayCenterServiceController.totalDisplayServiceProduct.value} Results',
              style: Theme.of(context).textTheme.bodySmall,
            ),),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
