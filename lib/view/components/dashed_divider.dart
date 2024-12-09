import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class DashedDivider extends StatelessWidget {
  final double marginBottom;
  final double horizontalPadding;
  final double thickness;
  final Color color;
  const DashedDivider({super.key, this.marginBottom = 0, this.horizontalPadding = 0, this.color = AppColors.neutral70, this.thickness = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: DottedLine(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        lineLength: double.infinity,
        lineThickness: thickness,
        dashLength: 4.0,
        dashColor: color,
        dashRadius: 0.0,
        dashGapLength: 4.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }
}
