import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_textstyles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: "Lato",
      appBarTheme: AppBarTheme(
        color: AppColors.primary,
        titleSpacing: 0,
        titleTextStyle:
            AppTextStyles.headlineSmall.copyWith(color: AppColors.white),
        foregroundColor: AppColors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom().copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return AppColors.primary
                    .withOpacity(0.1); // Feedback color for tap
              }
              return null; // Default feedback color
            },
          ),
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: AppTextStyles.headlineSmall,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineLarge: AppTextStyles.headlineLarge,
        bodySmall: AppTextStyles.bodySmall,
        bodyMedium: AppTextStyles.bodyMedium,
        bodyLarge: AppTextStyles.bodyLarge,
        titleSmall: AppTextStyles.titleSmall,
        titleMedium: AppTextStyles.titleMedium,
        titleLarge: AppTextStyles.titleLarge,
        labelSmall: AppTextStyles.labelSmall,
        labelMedium: AppTextStyles.labelMedium,
        labelLarge: AppTextStyles.labelLarge,
        displaySmall: AppTextStyles.displaySmall,
        displayMedium: AppTextStyles.displayMedium,
        displayLarge: AppTextStyles.displayLarge,
      ));
}
