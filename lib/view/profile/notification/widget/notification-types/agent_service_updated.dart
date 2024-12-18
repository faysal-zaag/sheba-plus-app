import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/components/vertical_bordered_text_container.dart';
import 'package:sheba_plus/view/profile/notification/widget/meeting_waiting_container.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class AgentServiceUpdated extends StatelessWidget {
  final String message;
  final int meetingTime;
  const AgentServiceUpdated({super.key, required this.message, required this.meetingTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.allPadding16,
          child: Container(
            width: double.infinity,
            decoration: Styles.roundedWhite,
            padding: AppPaddings.allPadding16,
            child: Text(
              message,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
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
            Padding(
              padding: AppPaddings.allPadding16,
              child: MeetingWaitingContainer(scheduleConfirmed: true, meetingTime: meetingTime),
            )
          ],
        )
      ],
    );
  }
}
