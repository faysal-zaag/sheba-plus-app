import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification_card.dart';
import 'package:sheba_plus/view/profile/notification/widget/notifications_loading.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import '../../components/custom_tab.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationController = Get.find<NotificationController>();
  final profileController = Get.find<ProfileController>();

  void _initCall() async {
    await notificationController.getNotifications();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCall();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => CustomTab(
            activeItem: notificationController.selectedNotificationHistoryType.value,
            tabItems: [ProfileScreenTexts.all, "${ProfileScreenTexts.unread} (${notificationController.unReadNotifications.value})"],
            onTap: (value) async {
              if (value.contains(ProfileScreenTexts.unread)) {
                notificationController.getNotifications(readStatus: false);
              } else if (value == ProfileScreenTexts.all) {
                notificationController.getNotifications();
              }
              notificationController.selectedNotificationHistoryType(value);
            })),
        Obx(
          () => notificationController.unReadNotifications.value > 0
              ? Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: GestureDetector(
                    onTap: () async {
                      await notificationController.markAllAsRead();
                    },
                    child: Row(
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
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(color: AppColors.primary),
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
        16.kH,
        Expanded(
          child: Obx(
            () => notificationController.getNotificationsLoading.isTrue
                ? const NotificationsLoading()
                : ListView.separated(
                    itemBuilder: (_, index) => Obx(
                      () => NotificationCard(
                        notification: notificationController.notifications[index],
                        user: profileController.user.value,
                        readMoreOnTap: () => notificationController.readMoreOnTap(index),
                        readMoreOn: notificationController.expandedNotifications.contains(index),
                      ),
                    ),
                    separatorBuilder: (_, index) => 12.kH,
                    itemCount: notificationController.notifications.length,
                  ),
          ),
        ),
      ],
    );
  }
}
