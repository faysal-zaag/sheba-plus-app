import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';
import 'package:sheba_plus/view/styles.dart';

class OrderShimmerCard extends StatelessWidget {
  const OrderShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: AppBorderRadius.circularRadius8,
        ),
        padding: AppPaddings.allPadding16,
        child: Column(
          children: [
            // Top Section with Ticket and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Placeholder for Ticket Number
                    Container(
                      height: 12,
                      width: 100,
                      color: AppColors.cardBg,
                    ),
                    8.kH,
                    // Placeholder for Order Status
                    Container(
                      height: 12,
                      width: 80,
                      color: AppColors.cardBg,
                    ),
                  ],
                ),
                // Right Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Placeholder for Date
                    Container(
                      height: 12,
                      width: 60,
                      color: AppColors.cardBg,
                    ),
                    8.kH,
                    // Placeholder for Time
                    Container(
                      height: 12,
                      width: 50,
                      color: AppColors.cardBg,
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
            // Placeholder for "View Details"
            Container(
              height: 12,
              width: 100,
              color: AppColors.cardBg,
            ),
          ],
        ),
      ),
    );
  }
}
