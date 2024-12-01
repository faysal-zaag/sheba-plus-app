import 'package:get/get.dart';
import 'package:sheba_plus/view/home/controller/home_controller.dart';

class HomeMiddleware extends GetMiddleware {
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    // TODO: implement onBindingsStart
    final homeController = Get.find<HomeController>();
    homeController.getServices();
    return super.onBindingsStart(bindings);
  }
}
