import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/routes/routes.dart'; // Import PhosphorIcons

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool userIcon;

  const CustomAppBar({super.key, this.userIcon = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Sheba Plus"),
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
                    Get.toNamed(Routes.signIn);
                  },
                  icon: Icon(PhosphorIcons.user()))
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
