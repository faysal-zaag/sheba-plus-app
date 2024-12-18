import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/styles.dart';

class PurchaseAgentService extends StatelessWidget {
  final String message;
  const PurchaseAgentService({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.allPadding16,
      child: Container(
        width: double.infinity,
        decoration: Styles.roundedWhite,
        padding: AppPaddings.allPadding16,
        child: Text(
          message,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
