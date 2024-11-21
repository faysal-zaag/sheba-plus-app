import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/view/home/home_screen.dart';
import 'package:sheba_plus/view/profile/profile_screen.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  late List<Widget> widgetOptions;

  NavigationController() {
    widgetOptions = <Widget>[
      const HomeScreen(),
      const ProfileScreen(),
    ];
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
