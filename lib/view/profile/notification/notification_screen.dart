import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/paginated_listview.dart';
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
    if(notificationController.notificationAlreadyLoaded.isFalse){
      await notificationController.getNotifications();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initCall();
    });
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
                : PaginatedListview(
                    itemBuilder: (_, index) => Obx(
                      () => NotificationCard(
                        notification: notificationController.notifications[index],
                        readMoreOnTap: () => notificationController.readMoreOnTap(index),
                        readMoreOn: notificationController.expandedNotifications.contains(index),
                      ),
                    ),
                    totalPages: notificationController.totalPages.value,
                    currentPage: notificationController.currentPage.value,
                    itemCount: notificationController.notifications.length,
                    onRefresh: onRefresh,
                    onFetchNextPage: onFetchNextPage,
                    fetchingMoreDataLoading: notificationController.getMoreNotificationsLoading.value,
                    noDataMessage: ProfileScreenTexts.noNotificationFound,
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> onRefresh() async {
    return await notificationController.getNotifications();
  }

  Future<void> onFetchNextPage() async {
    return await notificationController.getNotifications(page: notificationController.currentPage.value + 1);
  }
}
