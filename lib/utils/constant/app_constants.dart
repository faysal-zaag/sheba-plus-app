import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppConstants {
  static const assetImagePath = "assets/images";
  static const List<String> imgList = [
    "assets/carousel/carousel-1.jpg",
    "assets/carousel/carousel-2.jpg",
    "assets/carousel/carousel-3.jpg",
  ];

  static const List<String> drawerMenuItems = [
    "Home",
    "Display Center",
    "Track My Order",
    "Help & Support",
    "Language",
  ];

  static const List<String> languages = ["English", "Bangla"];

  static const List<String> profileMenuList = [
    "Account Management",
    "Saved Address",
    "Order History",
    "Reward Points",
    "Notification"
  ];

  static List<PhosphorIconData> profileMenuIcons = [
    PhosphorIcons.user(),
    PhosphorIcons.mapPin(),
    PhosphorIcons.clockCounterClockwise(),
    PhosphorIcons.gift(),
    PhosphorIcons.bell(),
  ];
}
