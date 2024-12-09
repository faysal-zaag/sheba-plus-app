import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

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
                  text: "footerYear".tr,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.neutral70),
                ),
                TextSpan(
                  text: "footerCompany".tr,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.white),
                ),
                TextSpan(
                  text: "footerAffiliates".tr,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.neutral70),
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
                  text: "footerRights".tr,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.neutral70),
                ),
                TextSpan(
                  text: "footerTrademark".tr,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.white),
                ),
                TextSpan(
                  text: "footerTrademarkOf".tr,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.neutral70),
                ),
                TextSpan(
                  text: "footerTrademarkCompany".tr,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.neutral70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
