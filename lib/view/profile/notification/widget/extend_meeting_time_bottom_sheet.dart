import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/bottom_sheet_header.dart';
import 'package:sheba_plus/view/profile/notification/widget/meeting_time_extend_form.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';

class ExtendMeetingTimeBottomSheet extends StatelessWidget {
  const ExtendMeetingTimeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: AppPaddings.screenPadding,
      color: AppColors.white,
      child: Column(
        children: [
          BottomSheetHeader(
            title: ProfileScreenTexts.extendMeetingTime,
          ),
          24.kH,
          const Expanded(child: MeetingTimeExtendForm())
        ],
      ),
    );
  }
}
