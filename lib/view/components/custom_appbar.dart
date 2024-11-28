import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/components/project_branding.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool userIcon;
  final bool displayCenter;

  CustomAppBar({super.key, this.userIcon = false, this.displayCenter = false});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const ProjectBranding(),
      leading: IconButton(
        icon: Icon(PhosphorIcons.list()),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: userIcon
          ? [
              IconButton(
                  onPressed: () {
                    if (authController.isLoggedIn.isTrue) {
                      Get.toNamed(Routes.profile);
                    } else {
                      Get.toNamed(Routes.signIn);
                    }
                  },
                  icon: Icon(PhosphorIcons.user()))
            ]
          : displayCenter && authController.isLoggedIn.isFalse
              ? []
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
