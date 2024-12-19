import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/message_container.dart';

class AgentShoppingCompleted extends StatelessWidget {
  final String message;
  const AgentShoppingCompleted({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: AppPaddings.screenPadding,
      margin: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Image.asset(
            AppImages.completed,
            width: 175,
          ),
          16.kH,
          MessageContainer(
            backgroundColor: AppColors.background2,
            borderColor: Colors.transparent,
            message: message,
          )
        ],
      ),
    );
  }
}
