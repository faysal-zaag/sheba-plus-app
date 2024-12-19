import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/components/vertical_bordered_text_container.dart';
import 'package:sheba_plus/view/profile/notification/widget/meeting_waiting_container.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';

class MeetingStarted extends StatelessWidget {
  final String message;
  final int meetingTime;
  final int meetingEndTime;
  final VoidCallback showExtendMeetingTimeSheet;

  const MeetingStarted({super.key, required this.message, required this.meetingTime, required this.meetingEndTime, required this.showExtendMeetingTimeSheet});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.allPadding16,
          child: MessageContainer(
            message: message,
            backgroundColor: AppColors.background2,
            borderColor: Colors.transparent,
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
                meetingTime: meetingEndTime,
                borderRadius: 4,
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
        VerticalBorderedContainer(
          padding: 8,
          child: Center(
            child: TextButton(
              onPressed: showExtendMeetingTimeSheet,
              child: Text(
                ProfileScreenTexts.extendMeetingTime,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: AppPaddings.allPadding16,
          child: MeetingWaitingContainer(),
        )
      ],
    );
  }
}
