import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../utils/constant/app_colors.dart';

class CustomBottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomNavBarWidget({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(8.0),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: AppColors.primary,
        unselectedItemColor: AppColors.blackTitle,
        showUnselectedLabels: true,
        elevation: 0,
        backgroundColor: AppColors.cardBg,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.house()),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.package()),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.magnifyingGlass()),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.user()),
            label: 'Profile',
          ),
        ],),
    );
  }
}
