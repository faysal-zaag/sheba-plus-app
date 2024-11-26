import 'package:flutter/material.dart';
import '../utils/constant/app_border_radius.dart';
import '../utils/constant/app_colors.dart';

class Styles {
  static const BoxShadow boxShadow = BoxShadow(
    color: Color(0x0A000000),
    offset: Offset(0, 0),
    blurRadius: 16,
    spreadRadius: 0,
  );

  static BoxDecoration decorationWithBoxShadow = BoxDecoration(
    color: AppColors.white,
    boxShadow: const [Styles.boxShadow],
    borderRadius: AppBorderRadius.circularRadius8,
  );

  static BoxDecoration roundedWhite = BoxDecoration(
    color: AppColors.white,
    borderRadius: AppBorderRadius.circularRadius8,
  );
}
