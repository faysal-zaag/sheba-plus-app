import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';

class VerticalBorderedContainer extends StatelessWidget {
  final Widget child;
  final double padding;
  const VerticalBorderedContainer({super.key, required this.child, this.padding = 16});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.background2,
        border: Border(
          top: BorderSide(color: AppColors.borderE6),
          bottom: BorderSide(color: AppColors.borderE6),
        ),
      ),
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }
}
