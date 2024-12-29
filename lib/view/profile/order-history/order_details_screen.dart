import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/models/notification/user_notification.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/vertical_bordered_text_container.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/agent_service_invalid.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/agent_service_updated.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/agent_shopping_completed.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/meeting_started.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/purchase_agent_service.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/shopping_item_details.dart';
import 'package:sheba_plus/view/profile/notification/widget/order-review/order_review_questions.dart';
import 'package:sheba_plus/view/profile/notification/widget/order_status_tracks.dart';
import 'package:sheba_plus/view/profile/order-history/controller/order_controller.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/services/agent-shopping/controller/agent_shopping_controller.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int orderId;

  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final notificationController = Get.find<NotificationController>();
  final agentShoppingController = Get.find<AgentShoppingController>();
  final orderController = Get.find<OrderController>();
  final globalController = Get.find<GlobalController>();

  void _initCall() async {
    final notificationType = await notificationController.getLatestNotification(dataId: widget.orderId);
    if (notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) {
      await orderController.getOrderDetails(orderId: widget.orderId);
    }
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

          return notificationController.getLatestNotificationLoading.isTrue || orderController.getOrdersLoading.isTrue
              ? const Center(
                  child: CustomLoader(),
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
      int remainingTime = notificationController.getRemainingTime((int.parse(latestNotification.body?.meetingTime ?? "0")));
      if (remainingTime > 15) {
        return PurchaseAgentService(
          message: notificationController.getPurchaseAgentServiceNotificationMessage(notification: latestNotification),
        );
      } else if (remainingTime <= 15 && remainingTime != 0) {
        return AgentServiceUpdated(
          message: notificationController.getReminderMessage(notification: latestNotification, remainingTime: remainingTime),
          meetingTime: int.parse(latestNotification.body?.meetingTime ?? "0"),
        );
      } else if (remainingTime == 0) {
        return MeetingStarted(
          message: notificationController.getMeetingStartedNotificationMessage(notification: latestNotification),
          meetingTime: int.parse(latestNotification.body?.meetingTime ?? "0"),
          meetingEndTime: int.parse(latestNotification.body?.meetingEndTime ?? "0"),
          showExtendMeetingTimeSheet: () => agentShoppingController.showExtendMeetingTimeSheet(
            context: context,
            orderId: latestNotification.dataId ?? 0,
          ),
        );
      }
      return const SizedBox();
    } else if (latestNotification.notificationType == AgentOrderNotificationType.AGENT_SERVICE_INVALID.name) {
      return AgentServiceInvalid(
        message: notificationController.getInvalidNotificationMessage(notification: latestNotification),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.AGENT_SERVICE_UPDATED.name) {
      return AgentServiceUpdated(
        message: notificationController.getAgentServiceUpdatedNotificationMessage(notification: latestNotification),
        meetingTime: int.parse(latestNotification.body?.meetingTime ?? "0"),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.SHOPPING_ITEM_DETAILS.name) {
      return Obx(
        () => orderController.getOrderDetailsLoading.isTrue
            ? const SizedBox(
                height: 400,
                child: Center(
                  child: CustomLoader(),
                ),
              )
            : Column(
                children: [
                  ShoppingItemDetails(
                    orderId: latestNotification.dataId ?? 0,
                    message: notificationController.getShoppingDetailsNotificationMessage(notification: latestNotification),
                    shoppingDetailsList: orderController.orderDetails.value.shoppingDetailsList,
                    invoice: orderController.orderDetails.value.invoice,
                    currentCadRate: orderController.orderDetails.value.currentCadRate,
                    hourBooked: orderController.orderDetails.value.hourBooked,
                  ),
                  24.kH,
                  Padding(
                    padding: AppPaddings.uPadding16,
                    child: CustomPrimaryButton(
                        label: GlobalTexts.proceed,
                        onClick: () {
                          Get.toNamed(Routes.finalCheckOutScreen);
                        }),
                  ),
                ],
              ),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.AGENT_SHOPPING_COMPLETED.name) {
      return AgentShoppingCompleted(
        message: notificationController.getAgentShoppingCompletedMessage(notification: latestNotification),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.MEETING_AND_BUDGET_EXTENDED.name) {
      return MeetingStarted(
        message: notificationController.getMeetingStartedNotificationMessage(notification: latestNotification),
        meetingTime: int.parse(latestNotification.body?.meetingTime ?? "0"),
        meetingEndTime: int.parse(latestNotification.body?.meetingEndTime ?? "0"),
        showExtendMeetingTimeSheet: () => agentShoppingController.showExtendMeetingTimeSheet(
          context: context,
          orderId: latestNotification.dataId ?? 0,
        ),
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.TRANSACTION_COMPLETED.name) {
      return Column(
        children: [
          AgentShoppingCompleted(
            message: notificationController.getAgentTransactionCompletedMessage(notification: latestNotification),
          ),
          Padding(
            padding: AppPaddings.allPadding16,
            child: MessageContainer(
              message: "",
              child: Row(
                children: [
                  Image.asset(
                    AppImages.giftBox,
                    width: 24,
                  ),
                  16.kW,
                  Expanded(
                    child: Text(
                      "Congratulations you earned ${latestNotification.body?.achievePoint} Promo points!",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.subtext),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    } else if (latestNotification.notificationType == AgentOrderNotificationType.ORDER_STATUS.name) {
      return Column(
        children: [
          OrderStatusTracks(
            orderStatus: latestNotification.body?.orderStatus ?? "",
          ),
          if (latestNotification.body?.orderStatus == ORDER_STATUS.DELIVERED.name) const OrderReviewQuestions(),
        ],
      );
    } else {
      return const Center(child: Text("Unknown notification type"));
    }
  }
}
