import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

class DrawerSocialIcons extends StatelessWidget {
  const DrawerSocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DrawerSocialIcon(
            icon: PhosphorIcons.facebookLogo(PhosphorIconsStyle.fill)),
        12.kW,
        DrawerSocialIcon(
            icon: PhosphorIcons.instagramLogo(PhosphorIconsStyle.fill)),
        12.kW,
        DrawerSocialIcon(
            icon: PhosphorIcons.youtubeLogo(PhosphorIconsStyle.fill)),
      ],
    );
  }
}

class DrawerSocialIcon extends StatelessWidget {
  final PhosphorIconData icon;

  const DrawerSocialIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.neutral70, width: 2)),
      child: Center(
        child: Icon(
          icon,
          color: AppColors.white,
        ),
      ),
    );
  }
}
