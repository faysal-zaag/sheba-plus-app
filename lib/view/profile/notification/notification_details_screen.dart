import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/models/notification/user_notification.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/vertical_bordered_text_container.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/agent_service_invalid.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/agent_service_updated.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/agent_shopping_completed.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/meeting_started.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/purchase_agent_service.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/shopping_item_details.dart';
import 'package:sheba_plus/view/profile/notification/widget/order-review/order_review_questions.dart';
import 'package:sheba_plus/view/profile/notification/widget/order_status_tracks.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/shopping_details_container.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/sopping_summary.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/services/agent-shopping/controller/agent_shopping_controller.dart';

class NotificationDetailsScreen extends StatefulWidget {
  final UserNotification notification;

  const NotificationDetailsScreen({super.key, required this.notification});

  @override
  State<NotificationDetailsScreen> createState() => _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  final notificationController = Get.find<NotificationController>();
  final agentShoppingController = Get.find<AgentShoppingController>();
  final globalController = Get.find<GlobalController>();

  void _initCall() async {
    if (widget.notification.notificationType == AgentOrderNotificationType.COMMON_USER_NOTIFICATION.name) {
      await notificationController.getSingleNotificationDetails(id: widget.notification.id);
    } else {
      final notificationType = await notificationController.getLatestNotification(dataId: widget.notification.dataId ?? 0);
      if (notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) {
        await agentShoppingController.getOrderDetails(orderId: widget.notification.dataId ?? 0);
      }
    }
    if (!widget.notification.readStats) await notificationController.markAsRead(notificationId: widget.notification.id);
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
    agentShoppingController.resetFields();
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
                                child: buildNotificationWidget(latestNotification),
                              ),
                            )
                          ],
                        );
        },
      ),
    );
  }

  Widget buildNotificationWidget(UserNotification latestNotification) {
    if (latestNotification.notificationType == AgentOrderNotificationType.PURCHASE_AGENT_SERVICE.name) {
      return PurchaseAgentService(
        message: notificationController.getPurchaseAgentServiceNotificationMessage(notification: latestNotification),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.AGENT_SERVICE_INVALID.name) {
      return AgentServiceInvalid(
        message: notificationController.getInvalidNotificationMessage(notification: latestNotification),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.AGENT_SERVICE_UPDATED.name) {
      return AgentServiceUpdated(
        message: notificationController.getAgentServiceUpdatedNotificationMessage(notification: latestNotification),
        meetingTime: int.parse(latestNotification.body?.meetingTime ?? "0"),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.TIME_LEFT.name) {
      return AgentServiceUpdated(
        message: notificationController.getAgentServiceUpdatedNotificationMessage(notification: latestNotification),
        meetingTime: int.parse(latestNotification.body?.meetingTime ?? "0"),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.MEETING_STARTED.name) {
      return MeetingStarted(
        message: notificationController.getMeetingStartedNotificationMessage(notification: latestNotification),
        meetingTime: int.parse(latestNotification.body?.meetingTime ?? "0"),
        meetingEndTime: int.parse(latestNotification.body?.meetingEndTime ?? "0"),
        showExtendMeetingTimeSheet: () => agentShoppingController.showExtendMeetingTimeSheet(
          context: context,
          orderId: latestNotification.dataId ?? 0,
        ),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) {
      return Obx(
        () => agentShoppingController.getOrderDetailsLoading.isTrue
            ? const SizedBox(
                height: 400,
                child: Center(
                  child: CustomLoader(),
                ),
              )
            : ShoppingItemDetails(
                message: notificationController.getShoppingDetailsNotificationMessage(notification: latestNotification),
                shoppingDetailsList: agentShoppingController.shoppingDetailsList,
                invoice: agentShoppingController.invoice.value,
                config: globalController.globalConfig.value,
              ),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.ORDER_STATUS.name) {
      return const Column(
        children: [
          OrderStatusTracks(),
          OrderReviewQuestions(),
        ],
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.AGENT_SHOPPING_COMPLETED) {
      return AgentShoppingCompleted(
        message: notificationController.getAgentShoppingCompletedMessage(notification: latestNotification),
      );
    } else {
      return const Center(child: Text("Unknown notification type"));
    }
  }
}
