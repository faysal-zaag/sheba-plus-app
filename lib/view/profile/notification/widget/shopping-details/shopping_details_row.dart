import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class ShoppingDetailsRow extends StatelessWidget {
  final bool header;
  final String title1;
  final String title2;
  final String title3;
  final String title4;

  const ShoppingDetailsRow({
    super.key,
    this.header = false,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = header
        ? Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: AppColors.hintText)
        : Theme.of(context).textTheme.titleSmall;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title1,
            style: textStyle,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(title2, style: textStyle),
        ),
        Expanded(
          flex: 2,
          child: Text(title3, style: textStyle),
        ),
        Expanded(
          flex: 3,
          child: Text(
            title4,
            style: textStyle,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
