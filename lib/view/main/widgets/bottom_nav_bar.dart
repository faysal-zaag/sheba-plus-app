import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/navigation_controller.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final navController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: navController.selectedIndex.value,
        onTap: (index) {
          navController.changeTabIndex(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
