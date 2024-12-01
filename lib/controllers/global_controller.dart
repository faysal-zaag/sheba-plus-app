import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/view/auth/widgets/modals/terms_and_condition_modal.dart';

class GlobalController extends GetxController {
  final termsAccepted = false.obs;

  void showTermsAndConditionSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows dynamic height adjustment
      backgroundColor: Colors.transparent, // Makes blur visible
      builder: (BuildContext context) {
        return Stack(
          children: [
            // Blur Effect on Remaining Screen
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.1), // Optional dark overlay
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter, // Ensures it sticks to the bottom
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom, // Keyboard safe area
                ),
                child: Wrap(
                  children: [
                    TermsAndConditionSheet(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
