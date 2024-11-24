import 'package:get/get.dart';
import 'package:sheba_plus/controllers/navigation_controller.dart';
import 'package:sheba_plus/controllers/network_controller.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeController());
    Get.put(NetworkController());
    Get.put(AuthController());
    Get.put(NavigationController());
  }
}
