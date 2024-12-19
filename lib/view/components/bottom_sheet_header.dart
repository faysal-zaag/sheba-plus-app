import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/view/components/custom_close_button.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;
  const BottomSheetHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        CustomCloseButton(onPressed: () => Get.back())
      ],
    );
  }
}
