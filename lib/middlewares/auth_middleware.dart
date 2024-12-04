import 'package:get/get.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    // TODO: implement onBindingsStart
    final storageService = Get.find<StorageService>();
    final authController = Get.find<AuthController>();
    final globalController = Get.find<GlobalController>();
    authController.isAuthenticated(accessToken: storageService.getAuthToken());
    globalController.getDefaultSetting();
    return super.onBindingsStart(bindings);
  }
}
