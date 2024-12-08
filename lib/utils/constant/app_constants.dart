import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/models/country.dart';

class AppConstants {
  static const assetImagePath = "assets/images";
  static const List<String> imgList = [
    "assets/carousel/carousel-1.jpg",
    "assets/carousel/carousel-2.jpg",
    "assets/carousel/carousel-3.jpg",
  ];

  static List<String> drawerMenuItems = [
    "home",
    "displayCenter",
    "trackMyOrder",
    "helpAndSupport",
    "language",
  ];

  static const List<String> languages = ["English", "বাংলা"];

  static List<String> profileMenuList = [
    "accountManagement",
    "savedAddress",
    "orderHistory",
    "rewardPoints",
    "notification",
  ];

  static List<PhosphorIconData> profileMenuIcons = [
    PhosphorIcons.user(),
    PhosphorIcons.mapPin(),
    PhosphorIcons.clockCounterClockwise(),
    PhosphorIcons.gift(),
    PhosphorIcons.bell(),
  ];

  static List<Country> countries = [
    Country(name: "Bangladesh", countryCode: "+880", isoCode: "BD"),
    Country(name: "Canada", countryCode: "+1", isoCode: "CA"),
  ];
}
