import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';

class NotificationCardShimmer extends StatelessWidget {
  const NotificationCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final roundedDecoration = BoxDecoration(
      color: AppColors.hintText,
      borderRadius: AppBorderRadius.circularRadius8,
    );

    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
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
                  decoration: roundedDecoration,
                ),
                const SizedBox(width: 8),
                Container(
                  height: 16,
                  width: 60,
                  decoration: roundedDecoration,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Notification Text Shimmer
            Container(
              height: 12,
              width: double.infinity,
              decoration: roundedDecoration,
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: double.infinity,
              decoration: roundedDecoration,
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: roundedDecoration,
            ),
            const SizedBox(height: 16),
            // Divider Shimmer
            Container(
              height: 1,
              width: double.infinity,
              decoration: roundedDecoration,
            ),
            const SizedBox(height: 16),
            // Button Shimmer
            Center(
              child: Container(
                height: 32,
                width: 200,
                decoration: roundedDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
