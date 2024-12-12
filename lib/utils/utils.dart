import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:toastification/toastification.dart';

class Utils{
  static void showToast({required String message, bool success = false, required Alignment alignment}) {
    toastification.show(
        title: Text(success ? "Success" : "Error"),
        description: Text(message),
        alignment: alignment,
        showProgressBar: false,
        style: ToastificationStyle.fillColored,
        type: success ? ToastificationType.success : ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 3),
        primaryColor: success ? AppColors.primary : AppColors.error
    );
  }

  static void showSuccessToast({required String message, Alignment alignment = Alignment.bottomCenter}) {
    showToast(message: message, success: true, alignment: alignment);
  }

  static void showErrorToast({required String message, Alignment alignment = Alignment.bottomCenter}) {
    showToast(message: message, success: false, alignment: alignment);
  }

  static Locale getInitialLocal() {
    String? code = StorageService().getLanguage();
    switch (code) {
      case "en":
        {
          return const Locale("en", "US");
        }
      case "bn":
        {
          return const Locale("bn", "BD");
        }
    }
    return const Locale("en", "US");
  }

  static Color hexToColor(String hexCode) {
    return Color(int.parse(hexCode.replaceFirst('#', '0xFF')));
  }

  static prettifyJson(dynamic json, String API) {
    // Convert the JSON data to a string with indentation for better readability
    final prettyString = JsonEncoder.withIndent('  ').convert(json);
    return debugPrint(
        "=-=-=-=-=-=-=-> show json data from ${API} : $prettyString",
        wrapWidth: 1024);
  }

}