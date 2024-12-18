import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/notification/user_notification.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/vertical_bordered_text_container.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/agent_service_invalid.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/agent_service_updated.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/purchase_agent_service.dart';
import 'package:sheba_plus/view/profile/notification/widget/order-review/order_review_questions.dart';
import 'package:sheba_plus/view/profile/notification/widget/order_status_tracks.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/shopping_details.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/sopping_summary.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';

class NotificationDetailsScreen extends StatefulWidget {
  final UserNotification notification;

  const NotificationDetailsScreen({super.key, required this.notification});

  @override
  State<NotificationDetailsScreen> createState() => _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  final notificationController = Get.find<NotificationController>();

  void _initCall() async {
    if (widget.notification.notificationType != AgentOrderNotificationType.COMMON_USER_NOTIFICATION.name) {
      await notificationController.getLatestNotification(dataId: widget.notification.dataId ?? 0);
    }
    else {
      await notificationController.getSingleNotificationDetails(id: widget.notification.id);
    }
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
    print(widget.notification.notificationType);
    
    return PrimaryScaffold(
      body: Obx(
        () {
          UserNotification? latestNotification = notificationController.latestNotification.value;

          return notificationController.getLatestNotificationLoading.isTrue
              ? const Center(
                  child: CustomLoader(),
                )
              : widget.notification.notificationType == AgentOrderNotificationType.COMMON_USER_NOTIFICATION.name
                  ? PurchaseAgentService(
                      message: widget.notification.details,
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
                                    if (latestNotification.notificationType == AgentOrderNotificationType.COMMON_USER_NOTIFICATION.name)
                                      PurchaseAgentService(
                                        message: latestNotification.details,
                                      ),
                                    if (latestNotification.notificationType == AgentOrderNotificationType.PURCHASE_AGENT_SERVICE.name)
                                      PurchaseAgentService(
                                        message: notificationController.getPurchaseAgentServiceNotificationMessage(notification: latestNotification),
                                      ),
                                    if (latestNotification.notificationType == AgentOrderNotificationType.AGENT_SERVICE_INVALID.name)
                                      AgentServiceInvalid(
                                        message: notificationController.getInvalidNotificationMessage(notification: latestNotification),
                                      ),
                                    if (latestNotification.notificationType == AgentOrderNotificationType.AGENT_SERVICE_UPDATED.name)
                                      AgentServiceUpdated(
                                        message: notificationController.getAgentServiceUpdatedNotificationMessage(notification: latestNotification),
                                        meetingTime: int.parse(latestNotification.body?.meetingTime ?? "0"),
                                      ),
                                    if (latestNotification.notificationType == AgentOrderNotificationType.TIME_LEFT.name)
                                      AgentServiceUpdated(
                                        message: notificationController.getAgentServiceUpdatedNotificationMessage(notification: latestNotification),
                                        meetingTime: int.parse(latestNotification.body?.meetingTime ?? "0"),
                                      ),
                                    if (latestNotification.notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) const ShoppingDetails(),
                                    if (latestNotification.notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) const Divider(),
                                    if (latestNotification.notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) const ShoppingDetails(),
                                    if (latestNotification.notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) const ShoppingSummary(),
                                    if (latestNotification.notificationType == AgentOrderNotificationType.ORDER_STATUS.name) const OrderStatusTracks(),
                                    if (latestNotification.notificationType == AgentOrderNotificationType.ORDER_STATUS.name) const OrderReviewQuestions(),
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
