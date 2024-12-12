import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/user/user.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';
import 'package:sheba_plus/models/notification/notification.dart';

class NotificationCard extends StatelessWidget {
  final UserNotification notification;
  final User user;
  final VoidCallback readMoreOnTap;
  final bool readMoreOn;

  const NotificationCard({super.key, required this.readMoreOnTap, required this.readMoreOn, required this.notification, required this.user});

  @override
  Widget build(BuildContext context) {
    String notificationDetails = notification.details;

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [Styles.boxShadow],
        color: notification.readStats ? AppColors.cardBg : AppColors.primary30,
        border: Border.all(color: notification.readStats ? Colors.transparent : AppColors.secondary500),
        borderRadius: AppBorderRadius.circularRadius8,
      ),
      padding: AppPaddings.allPadding16.copyWith(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (notification.ticketNo != null)
                // Ticker Number
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Text(
                        ProfileScreenTexts.ticketNumber,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      4.kW,
                      Text(
                        "#${notification.ticketNo}",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              // Notification
              RichText(
                text: TextSpan(
                  text: "Hi ",
                  style: Theme.of(context).textTheme.labelSmall,
                  children: [
                    TextSpan(
                      text: user.firstName,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: !readMoreOn ? _getTruncatedText("\n\n$notificationDetails", context) : "\n\n$notificationDetails",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    if (getTextPainter(context: context, text: notificationDetails).didExceedMaxLines)
                      TextSpan(
                        text: readMoreOn ? ProfileScreenTexts.readLess : ProfileScreenTexts.readMore,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                        recognizer: TapGestureRecognizer()..onTap = readMoreOnTap,
                      ),
                  ],
                ),
              ),
            ],
          ),
          8.kH,
          const Divider(
            color: AppColors.divider,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Get.toNamed(
                  Routes.notificationDetails,
                  arguments: notification, // Serialize to JSON
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                ProfileScreenTexts.trackThisOrder,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getTruncatedText(String text, BuildContext context) {
    final textPainter = getTextPainter(context: context, text: text);

    if (textPainter.didExceedMaxLines) {
      int endIndex = textPainter
          .getPositionForOffset(
            Offset(textPainter.width, textPainter.height),
          )
          .offset;
      return text.substring(0, endIndex);
    }
    return text;
  }

  TextPainter getTextPainter({required BuildContext context, required String text}) {
    return TextPainter(
      text: TextSpan(
        text: text,
      ),
      maxLines: 4,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);
  }
}
