import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class SummaryRow extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final Widget? customTitle;
  final Widget? customValue;
  final String value;
  final Color? titleColor;
  final Color? valueColor;
  const SummaryRow({super.key, required this.title, required this.value, this.customTitle, this.customValue, this.valueColor, this.titleColor, this.titleStyle, this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customTitle ?? Text(title, style: titleStyle ?? Theme.of(context).textTheme.titleSmall?.copyWith(color: titleColor ?? AppColors.subtext),),
          customValue ?? Text(value, style: valueStyle ?? Theme.of(context).textTheme.displayMedium?.copyWith(color: valueColor ?? AppColors.subtext)),
        ],
      ),
    );
  }
}
