import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/controllers/navigation_controller.dart';
import 'package:sheba_plus/controllers/network_controller.dart';
import 'package:sheba_plus/data/api/config.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/services/file_service.dart';
import 'package:sheba_plus/view/agent-shopping/controller/agent_shopping_controller.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/display_center/controller/display_service_controller.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/order-history/controller/order_controller.dart';
import 'package:sheba_plus/view/profile/reward-points/controller/reward_controller.dart';
import 'package:sheba_plus/view/profile/saved-address/controller/address_controller.dart';
import 'package:sheba_plus/view_model/repositories/address.repository.dart';
import 'package:sheba_plus/view_model/repositories/auth.repositories.dart';
import 'package:sheba_plus/view_model/repositories/global.repository.dart';
import 'package:sheba_plus/view_model/repositories/home.repository.dart';
import 'package:sheba_plus/view_model/repositories/profile.repository.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<StorageService>(() => StorageService());
    Get.lazyPut<Dio>(() => Api(Get.find<StorageService>()).dio);
    Get.lazyPut<FileService>(() => FileService(Get.find<Dio>()));
    Get.lazyPut<GlobalRepository>(() => GlobalRepository(Get.find<Dio>()));
    Get.lazyPut<HomeRepository>(() => HomeRepository(Get.find<Dio>()));
    Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find<Dio>()));
    Get.lazyPut<ProfileRepository>(() => ProfileRepository(Get.find<Dio>()));
    Get.lazyPut<AddressRepository>(() => AddressRepository(Get.find<Dio>()));

    Get.put(GlobalController(Get.find<GlobalRepository>()));
    Get.put(HomeController(Get.find<HomeRepository>()));
    Get.put(NetworkController());
    Get.put(NavigationController());
    Get.put(AddressController(Get.find<AddressRepository>()));
    Get.put(ProfileController(Get.find<ProfileRepository>(), Get.find<FileService>()));
    Get.put(OrderController());
    Get.put(RewardController());
    Get.put(NotificationController());
    Get.put(AddressController(Get.find<AddressRepository>()));
    Get.put(DisplayServiceController());
    Get.put(AgentShoppingController());

    Get.put<AuthController>(AuthController(Get.find<AuthRepository>(), Get.find<StorageService>(), Get.find<ProfileController>(), Get.find<AddressController>()));

  }
}
