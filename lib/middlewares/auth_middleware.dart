import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  final authController = Get.lazyPut(() => AuthController());

  @override
  RouteSettings? redirect(String? route) {
    bool isLoggedIn = false;

    if (isLoggedIn) {
    } else {
      print("User is not logged in, performing other operations");
    }

    return super.redirect(route);
  }
}
