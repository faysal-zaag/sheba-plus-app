import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/models/redem-point/redeem_point.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';
import 'package:sheba_plus/utils/formatters/date_formatters.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class RewardPointsCard extends StatelessWidget {
  final RedeemPoint redeemPoint;
  const RewardPointsCard({super.key, required this.redeemPoint});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [Styles.boxShadow],
        color: AppColors.primary30,
        borderRadius: AppBorderRadius.circularRadius8,
      ),
      padding: AppPaddings.allPadding16,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // payment
                  Text(
                    redeemPoint.redeemedBy,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  8.kH,
                  // Ticker Number
                  if(redeemPoint.invoiceNumber != null)
                  Row(
                    children: [
                      Text(
                        ProfileScreenTexts.ticketNumber,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      4.kW,
                      Text(
                        "#${redeemPoint.invoiceNumber}",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ticker Number
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.calendar(),
                        color: AppColors.paragraph,
                        size: 18,
                      ),
                      4.kW,
                      Text(
                        DateFormatters.formatDateFromMilliseconds(redeemPoint.createdAt),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: AppColors.paragraph),
                      ),
                    ],
                  ),
                  8.kH,
                  // Status
                  Row(
                    children: [
                      Icon(PhosphorIcons.clock(),
                          color: AppColors.paragraph, size: 18),
                      4.kW,
                      Text(
                        DateFormatters.formatTimeFromMilliseconds(redeemPoint.createdAt),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: AppColors.paragraph),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          8.kH,
          const Divider(
            color: AppColors.divider,
          ),
          8.kH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.giftBox,
                width: 24,
                height: 24,
              ),
              8.kW,
              Text(
                "${redeemPoint.redeemPointAction == "EARNED" ? "+" : "-"} ${redeemPoint.point}",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge?.copyWith(color: redeemPoint.redeemPointAction == "EARNED" ? AppColors.primary : AppColors.error),
              ),
            ],
          )
        ],
      ),
    );
  }
}
