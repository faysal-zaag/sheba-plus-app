import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

class OtpVerifyScreenHeader extends StatelessWidget {
  final Widget headerImage;
  final String heading;
  final String description;

  const OtpVerifyScreenHeader(
      {super.key,
        required this.heading,
        required this.description,
        required this.headerImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: headerImage,
        ),
        24.kH,
        24.kH,
        Text(
          heading,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        12.kH,
        Text(
          description,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),
        ),
      ],
    );
  }
}
