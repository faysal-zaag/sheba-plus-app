import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';

class MessageContainer extends StatelessWidget {
  final String message;
  const MessageContainer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: AppBorderRadius.circularRadius4,
          border: Border.all(color: AppColors.primary)),
      child: Padding(
        padding: AppPaddings.messagePadding,
        child: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: AppColors.subtext),
        ),
      ),
    );
  }
}
