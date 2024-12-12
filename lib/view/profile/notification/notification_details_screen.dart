import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/notification/notification.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/vertical_bordered_text_container.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/notification/widget/meeting_waiting_container.dart';
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
    await notificationController.markAsRead(notificationId: widget.notification.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCall();
  }

  @override
  Widget build(BuildContext context) {
    UserNotification notification = widget.notification;

    return PrimaryScaffold(
        body: Column(
      children: [
        if (notification.ticketNo != null) CustomHeaderContainer(title: "${ProfileScreenTexts.ticketNumber} #${notification.ticketNo}"),
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
                Padding(
                  padding: AppPaddings.allPadding16,
                  child: Container(
                    width: double.infinity,
                    decoration: Styles.roundedWhite,
                    padding: AppPaddings.allPadding16,
                    child: Text(
                      notification.details,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                const ShoppingDetails(),
                const Divider(),
                const ShoppingDetails(),
                const ShoppingSummary(),
                const OrderStatusTracks(),
                const OrderReviewQuestions(),
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
    ));
  }
}
