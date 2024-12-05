import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/constant/app_colors.dart';

class CustomCommonModalSheetParentWidget extends StatelessWidget {
  final List<Widget> children;
  const CustomCommonModalSheetParentWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.1), // Optional dark overlay
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          // Ensures it sticks to the bottom
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Keyboard safe area
            ),
            child: Wrap(
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
