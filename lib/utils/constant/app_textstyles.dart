import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class AppTextStyles {
  static TextStyle headlineSmall = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: AppColors.black
  );
  static TextStyle headlineMedium = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 24,
  );
  static TextStyle headlineLarge = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 31.5,
  );

  static TextStyle bodySmall = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  static TextStyle bodyMedium = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static TextStyle bodyLarge = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static TextStyle titleSmall = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  static TextStyle titleMedium = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.black
  );

  static TextStyle titleLarge = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static TextStyle labelSmall = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
  static TextStyle labelMedium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColors.black
  );

  static TextStyle labelLarge = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle displaySmall = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static TextStyle displayMedium = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
  );

  static TextStyle displayLarge = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 16,
  );
}