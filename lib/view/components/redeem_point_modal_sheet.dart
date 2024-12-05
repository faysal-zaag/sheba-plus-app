import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

import '../../utils/constant/app_colors.dart';
import '../../utils/constant/app_paddings.dart';
import 'custom_primary_button.dart';

class RedeemPointModalSheet extends StatelessWidget {
  final Function onNoPress;
  final Function onYesPress;
  final double totalDue;
  final int totalPoints;

  const RedeemPointModalSheet(
      {Key? key,
      required this.onNoPress,
      required this.onYesPress,
      required this.totalDue,
      required this.totalPoints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.allPadding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Redeem Points',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  PhosphorIcons.x(),
                ),
              ),
            ],
          ),
          20.kH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Total Due:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Your Total Redeem Points:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'CAD $totalDue',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '$totalPoints',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          20.kH,
          //TODO implement dynamic value
          Text(
            'If you want to REDEEM your points, you can save CAD 40.00. Do you want to REEDEM your points?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          20.kH,
          Row(
            children: [
              Expanded(
                child: CustomPrimaryButton(
                  label: 'No',
                  onClick: () {
                    onNoPress();
                  },
                  borderColor: AppColors.hintText,
                  color: AppColors.white,
                  labelColor: AppColors.blackTitle,
                ),
              ),
              10.kW,
              Expanded(
                child: CustomPrimaryButton(
                  label: 'Yes',
                  onClick: () {
                    onYesPress();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
