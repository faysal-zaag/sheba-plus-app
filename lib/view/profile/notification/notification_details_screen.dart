import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/components/custom_app_bar_container_widget.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/vertical_bordered_text_container.dart';
import 'package:sheba_plus/view/profile/notification/widget/meeting_waiting_container.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
        body: Column(
      children: [
        CustomAppBarContainerWidget(
            title: "${ProfileScreenTexts.ticketNumber} #DC1452080"),
        VerticalBorderedContainer(
          child: Text(
            ProfileScreenTexts.notificationDetailsHeader,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: AppPaddings.allPadding16,
                  child: Container(
                    decoration: Styles.roundedWhite,
                    padding: AppPaddings.allPadding16,
                    child: Text(
                      "Hi Ms Lessa,\n\nYou have purchased 5 Hours AGENT SERVICE to assist you for shopping at Basundhara Shopping Centre. Your shopping time will start on July 08, 2024 at 11PM (ET time) OR July 09, 2024 at 9AM (BD time).\n\nA Count-Down Clock (i.e., CDC) and Video Communication System (i.e., VCS) have already been installed at your track ticket details page, the CDC will guide about your time.\n\nRETURN & You will get a Notification as well as Alarming Signal on CDC when your time will be running out. You can extend your shopping time then or it will terminate by itself. At any point, you can terminate your shopping by CLICKING STOP.\n\nHope you enjoy your shopping with our AGENT.\n\nRegards\nDS.Com Team",
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.neutral70),
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
                            textStyle: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppColors.white),
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
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
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
