import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class CustomAppBarContainerWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const CustomAppBarContainerWidget(
      {super.key, required this.title, this.backgroundColor = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          PhosphorIcons.caretLeft(),
          size: 20,
          color: AppColors.blackTitle,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
