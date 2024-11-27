import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppConstants {
  static const assetImagePath = "assets/images";
  static const List<String> imgList = [
    "assets/carousel/carousel-1.jpg",
    "assets/carousel/carousel-2.jpg",
    "assets/carousel/carousel-3.jpg",
  ];

  static const List<String> profileMenuList = ["Account Management", "Saved Address", "Order History"];
  static List<PhosphorIconData> profileMenuIcons = [PhosphorIcons.user(), PhosphorIcons.mapPin(), PhosphorIcons.clockCounterClockwise(),];
}
