import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/auth/widgets/count_down_timer.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class MeetingWaitingContainer extends StatelessWidget {
  final double? height;
  final bool onlyTime;
  final TextStyle? textStyle;

  const MeetingWaitingContainer(
      {super.key, this.height, this.onlyTime = false, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 240,
      padding: AppPaddings.horizontal16,
      decoration: Styles.roundedWhite.copyWith(color: Colors.black),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!onlyTime)
              Text(
                ProfileScreenTexts.meetingWillStart,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.white),
              ),
            Container(
              margin: EdgeInsets.only(top: onlyTime ? 0 : 10.0),
              child: CountDownTimer(
                startTimeMilliseconds: DateTime.now()
                    .add(const Duration(days: 3))
                    .millisecondsSinceEpoch,
                textStyle: textStyle ?? Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.white),
              ),
            ),
            if (!onlyTime)
              Text(
                ProfileScreenTexts.clickToStartMeeting,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.white),
              ),
            if(!onlyTime)
            Container(
              margin: const EdgeInsets.only(top: 24.0),
              child: CustomPrimaryButton(
                  height: 48,
                  width: 150,
                  label: ProfileScreenTexts.startMeeting, onClick: (){}),
            )
          ],
        ),
      ),
    );
  }
}
