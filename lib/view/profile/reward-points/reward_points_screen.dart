import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/profile/order-history/widget/order_history_card.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/profile/reward-points/controller/reward_controller.dart';
import 'package:sheba_plus/view/profile/reward-points/widget/reward_points_card.dart';
import 'package:sheba_plus/view/styles.dart';

class RewardPointsScreen extends StatefulWidget {
  const RewardPointsScreen({super.key});

  @override
  State<RewardPointsScreen> createState() => _RewardPointsScreen();
}

class _RewardPointsScreen extends State<RewardPointsScreen> {
  final rewardController = Get.find<RewardController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: AppPaddings.screenPadding,
          decoration: Styles.roundedWhite.copyWith(color: AppColors.primary30, border: Border.all(color: AppColors.primary), boxShadow: [Styles.boxShadow]),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    AppImages.giftBox,
                    height: 32,
                    width: 32,
                  ),
                  8.kH,
                  Text(
                    "${ProfileScreenTexts.yourTotalPoints}: ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.subtext),
                  )
                ],
              ),
              16.kH,
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: AppColors.border)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${ProfileScreenTexts.whichIsEquivalentTo} ",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      style: Theme.of(context).textTheme.labelMedium,
                      "CAD 120.00",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        16.kH,
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) => const RewardPointsCard(),
            separatorBuilder: (_, index) => 12.kH,
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
