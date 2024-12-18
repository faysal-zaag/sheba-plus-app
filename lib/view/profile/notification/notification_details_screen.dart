import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/notification/user_notification.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/vertical_bordered_text_container.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/notification/widget/meeting_waiting_container.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/agent_service_invalid.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/purchase_agent_service.dart';
import 'package:sheba_plus/view/profile/notification/widget/order-review/order_review_questions.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/shopping_details.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/sopping_summary.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/profile/notification/widget/order_status_tracks.dart';
import 'package:sheba_plus/view/styles.dart';

class NotificationDetailsScreen extends StatefulWidget {
  final UserNotification notification;

  const NotificationDetailsScreen({super.key, required this.notification});

  @override
  State<NotificationDetailsScreen> createState() => _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  final notificationController = Get.find<NotificationController>();

  void _initCall() async {
    await notificationController.getLatestNotification(dataId: widget.notification.dataId ?? 0);
    await notificationController.markAsRead(notificationId: widget.notification.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCall();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    notificationController.latestNotification(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      body: Obx(
        () {
          UserNotification? latestNotification = notificationController.latestNotification.value;

          return notificationController.getLatestNotificationLoading.isTrue
              ? const Center(
                  child: CustomLoader(),
                )
              : latestNotification.dataId == null
                  ? const Center(
                      child: Text("Error occurred"),
                    )
                  : Column(
                      children: [
                        if (latestNotification.ticketNo != null) CustomHeaderContainer(title: "${ProfileScreenTexts.ticketNumber} #${latestNotification.ticketNo}"),
                        VerticalBorderedContainer(
                          child: Text(
                            ProfileScreenTexts.notificationDetailsHeader,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (latestNotification.notificationType == AgentOrderNotificationType.PURCHASE_AGENT_SERVICE.name)
                                  PurchaseAgentService(
                                    message: notificationController.getPurchaseAgentServiceNotificationMessage(notification: latestNotification),
                                  ),
                                if (latestNotification.notificationType == AgentOrderNotificationType.AGENT_SERVICE_INVALID.name)
                                  AgentServiceInvalid(
                                    message: notificationController.getInvalidNotificationMessage(notification: latestNotification),
                                  ),
                                if (latestNotification.notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) const ShoppingDetails(),
                                if (latestNotification.notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) const Divider(),
                                if (latestNotification.notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) const ShoppingDetails(),
                                if (latestNotification.notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) const ShoppingSummary(),
                                if (latestNotification.notificationType == AgentOrderNotificationType.ORDER_STATUS.name) const OrderStatusTracks(),
                                if (latestNotification.notificationType == AgentOrderNotificationType.ORDER_STATUS.name) const OrderReviewQuestions(),
                                if (latestNotification.notificationType == AgentOrderNotificationType.MEETING_STARTED.name)
                                  Column(
                                    children: [
                                      VerticalBorderedContainer(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              ProfileScreenTexts.agentOnlineMeeting,
                                            ),
                                            Text(
                                              ProfileScreenTexts.startMeeting,
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.neutral70),
                                            ),
                                          ],
                                        ),
                                      ),
                                      VerticalBorderedContainer(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${ProfileScreenTexts.meetingTimeLeft}:",
                                            ),
                                            MeetingWaitingContainer(
                                              height: 41,
                                              onlyTime: true,
                                              textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      VerticalBorderedContainer(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              ProfileScreenTexts.extendMeetingTime,
                                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                                    color: AppColors.primary,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: AppPaddings.allPadding16,
                                        child: MeetingWaitingContainer(),
                                      )
                                    ],
                                  )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
        },
      ),
    );
  }
}
