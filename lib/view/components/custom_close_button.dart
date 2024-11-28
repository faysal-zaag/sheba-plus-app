import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class CustomCloseButton extends StatelessWidget {
  final Color iconColor;
  final Icon? icon;
  final Color backgroundColor;
  final double iconSize;
  final double height;
  final double width;
  final VoidCallback onPressed;

  const CustomCloseButton(
      {super.key,
      this.iconColor = AppColors.black,
      this.backgroundColor = Colors.transparent,
      this.iconSize = 20, this.height = 24, this.width = 24, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
      child: Center(
        child: icon ?? Icon(
          PhosphorIcons.x(),
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
