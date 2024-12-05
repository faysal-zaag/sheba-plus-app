import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class NotificationCard extends StatelessWidget {
  final VoidCallback readMoreOnTap;
  final bool readMoreOn;

  const NotificationCard(
      {super.key, required this.readMoreOnTap, required this.readMoreOn});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [Styles.boxShadow],
        color: AppColors.cardBg,
        borderRadius: AppBorderRadius.circularRadius8,
      ),
      padding: AppPaddings.allPadding16.copyWith(bottom: 8),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ticker Number
              Row(
                children: [
                  Text(
                    ProfileScreenTexts.ticketNumber,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  4.kW,
                  Text(
                    "#3513511",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              8.kH,
              // Notification
              RichText(
                text: TextSpan(
                  text: "Hi ",
                  style: Theme.of(context).textTheme.labelSmall,
                  children: [
                    TextSpan(
                      text: "Ms Lessa,",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: !readMoreOn
                          ? _getTruncatedText(
                              "\nYou have purchased 5 Hours AGENT SERVICE to assist you for shopping at Basundhara Shopping Centre. Your shopping time will start on July 08, 2024 at 11PM (ET time) OR July 09, 2024 at 9AM (BD time). ",
                              context)
                          : "\nYou have purchased 5 Hours AGENT SERVICE to assist you for shopping at Basundhara Shopping Centre. Your shopping time will start on July 08, 2024 at 11PM (ET time) OR July 09, 2024 at 9AM (BD time). ",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    TextSpan(
                      text: readMoreOn
                          ? ProfileScreenTexts.readLess
                          : ProfileScreenTexts.readMore,
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
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.notificationDetails);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              ProfileScreenTexts.trackThisOrder,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  String _getTruncatedText(String text, BuildContext context) {
    const maxLines = 4;
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
      ),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

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
}
