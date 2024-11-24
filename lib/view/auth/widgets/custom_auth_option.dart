import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class CustomAuthOption extends StatelessWidget {
  final String imagePath;
  final Function() onTap;

  const CustomAuthOption({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: AppColors.background,
          border: Border.all(
            color: AppColors.border2,
          ),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}
