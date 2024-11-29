import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/profile/order-history/widget/order_status.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [Styles.boxShadow],
        color: AppColors.cardBg,
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
              // Ticker Number
              Row(
                children: [
                  Text(
                    ProfileScreenTexts.ticketNumber,
                    style: Theme
                        .of(context)
                        .textTheme
                        .displaySmall,
                  ),
                  4.kW,
                  Text(
                    "#3513511",
                    style: Theme
                        .of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              8.kH,
              // Status
              const OrderStatus(color: AppColors.blue, status: "On Shipment",),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ticker Number
              Row(
                children: [
                  Icon(PhosphorIcons.calendar(), color: AppColors.paragraph,
                    size: 18,),
                  4.kW,
                  Text(
                    "10 Jan, 2023",
                    style: Theme
                        .of(context)
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
                  Icon(PhosphorIcons.clock(), color: AppColors.paragraph,
                      size: 18),
                  4.kW,
                  Text(
                    "10:30 pm",
                    style: Theme
                        .of(context)
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
      const Divider(color: AppColors.divider,),
      8.kH,
      Text(ProfileScreenTexts.viewDetails, style: Theme.of(context).textTheme.displayMedium?.copyWith(
          fontSize: 12, color: AppColors.primary),)],
    )
    ,
    );
  }
}
