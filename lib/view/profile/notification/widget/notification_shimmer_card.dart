import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';

class NotificationCardShimmer extends StatelessWidget {
  const NotificationCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: AppBorderRadius.circularRadius8,
        ),
        padding: AppPaddings.allPadding16.copyWith(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ticket Number Shimmer
            Row(
              children: [
                Container(
                  height: 16,
                  width: 80,
                  color: AppColors.hintText,
                ),
                const SizedBox(width: 8),
                Container(
                  height: 16,
                  width: 60,
                  color: AppColors.hintText,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Notification Text Shimmer
            Container(
              height: 12,
              width: double.infinity,
              color: AppColors.shimmerBase,
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: double.infinity,
              color: AppColors.shimmerBase,
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: MediaQuery.of(context).size.width * 0.8,
              color: AppColors.shimmerBase,
            ),
            const SizedBox(height: 16),
            // Divider Shimmer
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.shimmerBase,
            ),
            const SizedBox(height: 16),
            // Button Shimmer
            Container(
              height: 32,
              width: 120,
              color: AppColors.shimmerBase,
            ),
          ],
        ),
      ),
    );
  }
}
