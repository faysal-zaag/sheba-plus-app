import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification_card.dart';
import 'package:sheba_plus/view/profile/order-history/widget/order_history_card.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import '../../components/custom_tab.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => CustomTab(
            activeItem:
                notificationController.selectedNotificationHistoryType.value,
            tabItems: [
              ProfileScreenTexts.all,
              "${ProfileScreenTexts.unread} (${12})"
            ],
            onTap: (value) =>
                notificationController.selectedNotificationHistoryType(value))),
        16.kH,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              PhosphorIcons.checks(),
              color: AppColors.primary,
            ),
            6.kW,
            Text(
              ProfileScreenTexts.markAllAsRead,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: AppColors.primary),
            )
          ],
        ),
        16.kH,
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) => Obx(() => NotificationCard(
                  readMoreOnTap: () =>
                      notificationController.readMoreOnTap(index),
                  readMoreOn: notificationController.expandedNotifications
                      .contains(index),
                )),
            separatorBuilder: (_, index) => 12.kH,
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
