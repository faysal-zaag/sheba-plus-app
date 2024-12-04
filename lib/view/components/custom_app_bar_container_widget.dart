import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

import '../../utils/constant/app_colors.dart';

class CustomAppBarContainerWidget extends StatelessWidget {
  final String title;

  const CustomAppBarContainerWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 30,
              color: AppColors.blackTitle,
            ),
          ),
          8.kW,
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
