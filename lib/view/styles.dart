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

  static InputDecoration getTextFieldInputDecoration({
    required BuildContext context,
    bool readOnly = false,
    BorderRadius? customBorder,
    Border? border,
    double borderRadius = 6.0,
    required Color fillColor,
    String? hintText,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
        focusedBorder: readOnly == true
            ? OutlineInputBorder(
                borderRadius:
                    customBorder ?? BorderRadius.circular(borderRadius),
                borderSide:
                    const BorderSide(color: AppColors.border, width: 1.0),
              )
            : OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.primary, width: 1.0),
                borderRadius:
                    customBorder ?? BorderRadius.circular(borderRadius),
              ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
          borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              color: const Color(0xff000000).withOpacity(0.1), width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              color: const Color(0xff000000).withOpacity(0.1), width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
          borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
        ),
        contentPadding: const EdgeInsets.only(bottom: 0.0, top: 15.0),
        prefix: const Padding(
          padding: EdgeInsets.only(left: 15.0),
        ),
        errorStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: AppColors.error),
        fillColor: fillColor,
        filled: true,
        hintText: hintText ?? "",
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.hintText),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon);
  }
}
