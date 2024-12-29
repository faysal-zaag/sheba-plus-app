import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/models/notification/user_notification.dart';
import 'package:sheba_plus/models/order/order.dart';
import 'package:sheba_plus/models/user/user.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/formatters/date_formatters.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/order-history/widget/order_status.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class OrderHistoryCard extends StatelessWidget {
  final Order order;
  final User user;

  const OrderHistoryCard({super.key, required this.order, required this.user});

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
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      4.kW,
                      Text(
                        "#${order.invoiceNumber}",
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  8.kH,
                  // Status
                  OrderStatus(
                    color: AppColors.blue,
                    status: order.status.replaceAll("_", " "),
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
                        DateFormatters.formatDateFromMilliseconds(order.createdAt),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.paragraph),
                      ),
                    ],
                  ),
                  8.kH,
                  // Status
                  Row(
                    children: [
                      Icon(PhosphorIcons.clock(), color: AppColors.paragraph, size: 18),
                      4.kW,
                      Text(
                        DateFormatters.formatTimeFromMilliseconds(order.createdAt),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.paragraph),
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
          InkWell(
            onTap: () {
              Get.toNamed(Routes.orderDetailsScreen, arguments: order.id);
            },
            child: Text(
              ProfileScreenTexts.viewDetails,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 12, color: AppColors.primary),
            ),
          )
        ],
      ),
    );
  }
}
