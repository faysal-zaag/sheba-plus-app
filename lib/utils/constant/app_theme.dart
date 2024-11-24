import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_textstyles.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: GoogleFonts.lato().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      titleSpacing: 0,
      titleTextStyle: AppTextStyles.headlineSmall.copyWith(color: AppColors.white),
      foregroundColor: AppColors.white
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
    )
  );
}