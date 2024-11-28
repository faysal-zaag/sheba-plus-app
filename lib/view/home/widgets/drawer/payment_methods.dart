import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "PAYMENT METHOD",
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: AppColors.white),
        ),
        16.kH,
        Row(
          children: [
            Image.asset(AppImages.visa, height: 16, width: 50,),
            20.kW,
            Image.asset(AppImages.master, height: 16,width: 25,),
            20.kW,
            Image.asset(AppImages.paypalWhite, height: 16, width: 60,),
          ],
        )
      ],
    );
  }
}
