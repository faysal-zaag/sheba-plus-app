import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/models/country.dart';
import 'package:sheba_plus/view/home/home_screen_texts.dart';

class AppConstants {
  static const assetImagePath = "assets/images";
  static const List<String> carouselImages = [
    "assets/carousel/carousel-1.jpg",
    "assets/carousel/carousel-2.jpg",
    "assets/carousel/carousel-3.jpg",
    "assets/carousel/carousel-4.jpg",
  ];

  static List<String> carouselHeaderTexts = [
    HomeScreenText.agentShopping,
    HomeScreenText.displayCenter,
    HomeScreenText.thirdParty,
    HomeScreenText.friendsFamily,
  ];

  static List<String> carouselHeaderDetails = [
    HomeScreenText.agentShoppingDetails1,
    HomeScreenText.displayCenterDetails1,
    HomeScreenText.thirdPartyDetails1,
    HomeScreenText.friendsFamilyDetails1,
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

  static Map<String, String> profileMenuListBangla = {
    "অ্যাকাউন্ট ব্যবস্থাপনা": 'accountManagement',
    "সংরক্ষিত ঠিকানা": 'savedAddress',
    "অর্ডার ইতিহাস": 'orderHistory',
    "রিওয়ার্ড পয়েন্টস": 'rewardPoints',
    "বিজ্ঞপ্তি": 'notification',
  };

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
