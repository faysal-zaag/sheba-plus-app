import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/home/home_texts.dart';

class FooterText extends StatelessWidget {
  const FooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: "2008-2024, ",style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.neutral70)
                ),
                TextSpan(
                  text: "SEBA.com",style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.white)
                ),
                TextSpan(
                  text: " Inc or its affiliates.",style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.neutral70)
                ),
              ],
            ),
          ),
          12.kH,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: "© All rights reserved. ",style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.neutral70)
                ),
                TextSpan(
                  text: "SEBA.com",style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.white)
                ),
                TextSpan(
                  text: " is a trademark of ",style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.neutral70)
                ),
                TextSpan(
                  text: "SEBA.com.Inc",style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.neutral70)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
