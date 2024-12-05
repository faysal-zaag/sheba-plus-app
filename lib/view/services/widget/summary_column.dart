import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

class SummaryColumn extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final Widget? customTitle;
  final Widget? customValue;
  final String value;
  final Color? titleColor;
  final Color? valueColor;
  const SummaryColumn({super.key, required this.title, this.titleStyle, this.valueStyle, this.customTitle, this.customValue, required this.value, this.titleColor, this.valueColor});

  @override
  Widget build(BuildContext context) {
    final subTextStyle = Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: subTextStyle,),
        4.kH,
        Text(value),
        4.kH,
      ],
    );
  }
}
