import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthMiddleware extends GetMiddleware {
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
