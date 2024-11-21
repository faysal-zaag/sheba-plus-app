import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/controllers/navigation_controller.dart';
import 'package:sheba_plus/view/main/widgets/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final NavigationController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sheba Plus"),
        leading: Icon(
          PhosphorIcons.list(),
        ),
      ),
      body: Obx(
            () => navController.widgetOptions
            .elementAt(navController.selectedIndex.value),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
