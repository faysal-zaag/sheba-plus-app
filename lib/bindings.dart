import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/navigation_controller.dart';
import 'package:sheba_plus/controllers/network_controller.dart';
import 'package:sheba_plus/data/api/config.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';
import 'package:sheba_plus/view_model/repositories/auth.repositories.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<StorageService>(() => StorageService());
    Get.lazyPut<Dio>(() => Api(Get.find<StorageService>()).dio);
    Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find<Dio>()));

    Get.put(HomeController());
    Get.put(NetworkController());
    Get.put(NavigationController());
    Get.put(ProfileController());

    Get.put<AuthController>(AuthController(Get.find<AuthRepository>(), Get.find<StorageService>(), Get.find<ProfileController>()));
  }
}
