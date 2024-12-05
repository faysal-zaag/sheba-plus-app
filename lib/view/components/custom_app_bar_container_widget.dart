import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';

class CustomAppBarContainerWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  const CustomAppBarContainerWidget({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: AppPaddings.allPadding6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                PhosphorIcons.caretLeft(),
                size: 20,
                color: AppColors.blackTitle,
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
