import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';

class MessageContainer extends StatelessWidget {
  final String message;
  final bool forOrderStatusMessage;
  final bool orderDelivered;
  final Color backgroundColor;
  final CrossAxisAlignment crossAxisAlignment;

  const MessageContainer(
      {super.key,
      required this.message,
      this.backgroundColor = AppColors.primaryLight,
      this.forOrderStatusMessage = false,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.orderDelivered = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: AppBorderRadius.circularRadius4,
          border: Border.all(color: AppColors.primary)),
      child: Padding(
        padding: AppPaddings.messagePadding,
        child: Row(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            if (forOrderStatusMessage)
              Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    PhosphorIcons.cube(),
                    color: AppColors.primary,
                    weight: 2,
                  )),
            Expanded(
              child: Column(
                children: [
                  if (orderDelivered)
                    Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Image.asset(AppImages.delivered, width: 80,)),
                  Text(
                    message,
                    textAlign: orderDelivered ? TextAlign.center : TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.subtext),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
