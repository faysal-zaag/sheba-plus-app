import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    // TODO: implement onBindingsStart
    print("Calling onBindingsStart");
    final storageService = Get.find<StorageService>();
    final authController = Get.find<AuthController>();
    authController.isAuthenticated(accessToken: storageService.getAuthToken());
    return super.onBindingsStart(bindings);
  }
}
