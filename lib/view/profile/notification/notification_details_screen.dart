import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/notification/user_notification.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification-types/purchase_agent_service.dart';
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

  void _initCall() async {
    await notificationController.getSingleNotificationDetails(id: widget.notification.id);
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
          return notificationController.getLatestNotificationLoading.isTrue
              ? const Center(
                  child: CustomLoader(),
                )
              : PurchaseAgentService(
                  message: widget.notification.details,
                );
        },
      ),
    );
  }
}
